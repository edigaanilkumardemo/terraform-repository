# source using git also we create instace without keypair 
module "git" {
  source = "github.com/edigaanilkumardemo/terraform-repository/day-8-source-module"
  ami = "ami-0cc9838aa7ab1dce7"
  aws_instance = "t2.micro"
  

}