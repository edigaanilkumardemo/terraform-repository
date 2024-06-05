
resource "aws_instance" "storeins3" {
    ami = "ami-0cc9838aa7ab1dce7"
    instance_type = "t2.micro"
  key_name = "my-keypair-01"
  tags = {
    Name = "maga"
  }
}
