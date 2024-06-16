resource "aws_instance" "iamlocal" {
  ami = var.ami
  instance_type = var.aws_instance
  key_name = var.key_name
  tags = {
    Name = "iphone"
  }
  
}