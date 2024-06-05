variable "ami" {
    description = "we create ec2 by using instace "
    type = string
    default =""
}
variable "aws_instance" {
    description = "we create instace type"
    type = string
    default = ""
}
variable "key_name" {
    description = "key use conncet for instace"
    type = string
    default = ""
  
}