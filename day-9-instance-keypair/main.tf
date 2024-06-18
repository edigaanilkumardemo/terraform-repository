resource "aws_key_pair" "instace-key" {
  key_name = "public-key"
  public_key = file("~/.ssh/id_rsa.pub") #here you need to define public key file path

}

resource "aws_instance" "dev" {
  ami                    = "ami-013e83f579886baeb"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.instace-key.public_key
  tags = {
    Name="key-tf"
  }
}