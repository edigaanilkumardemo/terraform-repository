# Define the AWS provider configuration.
provider "aws" {
  region = "ap-south-1"  # Replace with your desired AWS region.
}


resource "aws_key_pair" "example" {
  key_name   = "provisioner"  # Replace with your desired key name
  public_key = file("~/.ssh/id_rsa.pub") 


}
resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "provisionar-vpc"
  }
}

resource "aws_subnet" "sub2" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id
}

resource "aws_route_table" "RT" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "rta1" {
  subnet_id      = aws_subnet.sub2.id
  route_table_id = aws_route_table.RT.id
}

resource "aws_security_group" "webSg" {
  name   = "web"
  vpc_id = aws_vpc.myvpc.id

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Web-sg"
  }
}

resource "aws_instance" "server" {
  ami                    = "ami-0e1d06225679bc1c5"
  instance_type          = "t2.micro"
  key_name      = aws_key_pair.example.key_name
  vpc_security_group_ids = [aws_security_group.webSg.id]
  subnet_id = aws_subnet.sub2.id
  tags = {
    Name = "provsion-ec2"
  }


  connection {    #here connection block use is to connect to ec2 instance and print or run something
    type = "ssh"
    user = "ec2-user"
    #private_key =file("C:\Users\Ediga Anil kumar\.ssh\id_rsa")
    private_key = file("~/.ssh/id_rsa")
    host        = self.public_ip
  }
  


  # local execution procee 
 provisioner "local-exec" {
    command = "touch file159"
   
 }
 
  # File provisioner to copy a file from local to the remote EC2 instance
  provisioner "file" {
    source      = "file753"  # Replace with the path to your local file
    destination = "/home/ec2-user/file753"  # Replace with the path on the remote instance
  }
  # remote execution process g
  provisioner "remote-exec" {
    inline = [
"touch file7859",
"echo hello from aws >> file7859",
]
 }

}

 