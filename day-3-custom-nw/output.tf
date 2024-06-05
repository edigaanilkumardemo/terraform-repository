output "man" {
    value = aws_instance.iamlocal.arn
  
}

output "varls" {
    value = aws_instance.iamlocal.private_ip
    sensitive = true
}