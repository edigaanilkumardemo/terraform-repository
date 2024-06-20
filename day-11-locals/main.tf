locals {
  bucket-name = "${var.str-1}-${var.str-2}-${var.str-3}-123"
}

resource "aws_s3_bucket" "long-str" {
  bucket = local.bucket-name    #bucket name = "hello-kedhar-king-123"
  tags = {
    "Name" = local.bucket-name 
  }
}