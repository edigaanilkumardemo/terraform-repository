resource "aws_instance" "local" {
    ami = "ami-0cc9838aa7ab1dce7"  
    instance_type = "t2.micro"
    key_name = "my-keypair-01"
    tags = {
      Name = "terraform"
    }
}

resource "aws_s3_bucket" "aws" {
  bucket =  "devops-aws-1274"
}

#apply or destroy particular resource
#terraform apply -target=resource_type.resource.resource_name --> it's create specific resource  like --> terraform apply -target=aws_instance.local -auto-approve
#terraform delete -target=resource_type.resource.resource_name --> it's delete specific resource lieke--> terraform destroy -target=aws_instance.local -auto-approve