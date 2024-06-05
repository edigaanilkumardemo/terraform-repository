#creating vpc
resource "aws_vpc" "local-1" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "custom_vpc"
    }  
}
#creating subnet
resource "aws_subnet" "local-1" {
  vpc_id = aws_vpc.local-1.id
  #availability_zone = ap-south-1a
  cidr_block="10.0.1.0/24" 
}
#creating internet gateway
resource "aws_internet_gateway" "localname" {
    vpc_id = aws_vpc.local-1.id
    tags = {
      Name="custom_IG"
    }
  
}
#create route Table also configure the IG(edit routes)
resource "aws_route_table" "differentresourece" {
  vpc_id = aws_vpc.local-1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.localname.id
  }

}
#subnet association to add into route table (edit ass/public)
resource "aws_route_table_association" "thatsylocalname" {
    subnet_id = aws_subnet.local-1.id
    route_table_id = aws_route_table.differentresourece.id
}


#security group
resource "aws_security_group" "sg" {
  name = "anil"
  vpc_id = aws_vpc.local-1.id
  tags = {
    Name="custom_sg"
  }
 ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }


egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }


  }





















resource "aws_instance" "iamlocal" {
  ami = var.ami
  instance_type = var.aws_instance
  key_name = var.key_name
  subnet_id = aws_subnet.local-1.id
  tags = {
    Name = "wawa"
  }
  
}
