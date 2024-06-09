#creating ec2 with filiters

data "aws_ami" "amzlinux" {
  most_recent = true
  owners = [ "amazon" ]
  filter {
    name = "name"
    values = [ "amzn2-ami-hvm-*-gp2" ]
  }
  filter {
    name = "root-device-type"
    values = [ "ebs" ]
  }
  filter {
    name = "virtualization-type"
    values = [ "hvm" ]
  }
  filter {
    name = "architecture"
    values = [ "x86_64" ]
  }
}

# not recomanded 
data "aws_security_group" "dev" {
 id = "sg-06cc4ba0cf0e512f4" #here change your sg id details"

}
data "aws_subnet" "dev" {
  id = "subnet-0fc3dbcd85b2242a8" #here chnage your subnet id details
}
resource "aws_instance" "dev" {
    ami = data.aws_ami.amzlinux.id
    instance_type = "t2.micro"
    subnet_id = data.aws_subnet.dev.id
    security_groups = [data.aws_security_group.dev.id]

    tags = {
      Name = "dev-ec2"
    }
}