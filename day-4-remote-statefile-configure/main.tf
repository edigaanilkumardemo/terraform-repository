resource "aws_instance" "creationofinstace"{
    ami = "ami-00fa32593b478ad6e"
    instance_type = "t2.micro"
    key_name = "my-keypair-01"
    tags = {
      Name = "vivo"
    }
}