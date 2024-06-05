output "man" {
    value = aws_instance.iamlocal.arn
  
}
output "prv" {
  value =  aws_instance.iamlocal.public_ip
}
output "varls" {
    value = aws_instance.iamlocal.private_ip
    sensitive = true
}