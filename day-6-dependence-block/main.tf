resource "aws_s3_bucket" "hp" { 
    bucket = "company-06-06-24"
  
}
resource "aws_instance" "dependead" {
    ami = "ami-0cc9838aa7ab1dce7"
    instance_type = "t2.micro"
    key_name = "my-keypair-01"
    depends_on = [ aws_s3_bucket.hp ]
}




#depends_on = [ aws_s3_bucket.hp ]-->instace dependead  on s3 bucket so first create the s3 bucket the after create  instace