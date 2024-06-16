#By using main.tf and variables.tf (another directory) diffrent directory to create resoureces by using module (like terraform.tfvars)

module "use-sourcemodue" {
  source = "../day-8-source-module"
  ami = "ami-0cc9838aa7ab1dce7"
  aws_instance = "t2.micro"
  key_name = "my-keypair-01"

}