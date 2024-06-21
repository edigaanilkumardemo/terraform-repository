#variables.tf
variable "ec2-id" {
    type = string
    default = "ami-0cc9838aa7ab1dce7"
    description = "ec2 id creation"
  
}
variable "instace-type" {
  description = "instace family"
  default = "t2.micro"
  type = string
}
variable "connect-key" {
  default = "my-keypair-01"
  description = "key-name"
  type = string
}
variable "sandbox" {
    description = "name of servers"
    type = list(string)
    default = [ "devops","aws" ]
}

#main.tf
resource "aws_instance" "author" {
    ami = var.ec2-id
    instance_type = var.instace-type
    key_name = var.connect-key
    for_each = toset(var.sandbox) # for a set, each.value and each.key is the same
    tags = {
      Name = each.value
    }
  
}
