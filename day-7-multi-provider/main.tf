
# Provider-1 for us-east-1 (Default Provider)

provider "aws" {
    region = "ap-south-1"
  
}
#Another provider alias

provider "aws" {
    region = "us-east-1"
    alias = "america"
}

resource "aws_s3_bucket" "us-bucket" {
  bucket = "dkskjdkhgdsksddkh"
  provider = aws.america  #provider.value of alias
}
resource "aws_s3_bucket" "south-buk" {
    bucket = "djvdrofugiodugodd"
  
}