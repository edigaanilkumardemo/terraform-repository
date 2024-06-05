#terraform import aws_instance.<local name>  <instance id> -->to import existing resources command 
 #here import is localln name 
#Note : Here instance id is manually crrated onw 

resource "aws_instance" "importln" {
 ami = "ami-00fa32593b478ad6e"
 instance_type = "t2.micro"
 tags = {
   Name = "cm"
 }

}