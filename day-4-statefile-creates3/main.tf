resource "aws_s3_bucket" "statefile" {
  bucket = "statefile-store-the-s3bucket"
}
    
#DynamoDB creation for locking process
resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name = "statefile-lock-dynamo"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
 
  attribute {
    name = "LockID"
    type = "S"
  }
}