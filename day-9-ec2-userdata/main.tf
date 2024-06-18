resource "aws_instance" "local" {
    ami = "ami-0cc9838aa7ab1dce7"
    instance_type = "t2.micro"
    key_name = "my-keypair-01"
    user_data = file("userdata.sh")     # define your path and file name
    tags = {
      Name = "userdata"
    }
}