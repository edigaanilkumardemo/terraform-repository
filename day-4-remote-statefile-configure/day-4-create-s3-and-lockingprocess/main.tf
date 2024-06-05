resource "aws_s3_bucket" "DDB" {
  bucket = "statefile-createded-in-s3bucket"

}
#DynamoDB creation for locking process
resource "aws_dynamodb_table" "dynamodb-statelock" {
    name = "bucket-statefile-lock-dynamo"
     hash_key = "LockID"
    read_capacity = 20
    write_capacity = 20  
    attribute {
    name = "LockID"
    type = "S"
  }
}
