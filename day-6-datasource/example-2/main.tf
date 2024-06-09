#call the existing resource security,subnet 
data "aws_subnet" "selected" { 
  filter { 
    name   = "tag:Name" 
    values = ["subnet-1a"] 
  } 
} 
data "aws_security_group" "chose" {
  filter {
    name = "tag:Name"
    values = [ "linux-port" ]
  }
}
 
resource "aws_instance" "dependency" { 
    ami = "ami-0cc9838aa7ab1dce7" 
    instance_type = "t2.micro" 
    key_name = "my-keypair-01" 
    subnet_id = data.aws_subnet.selected.id
    security_groups = [ data.aws_security_group.chose.id ]
    tags = { 
      Name="datasource" 
    } 
   
}