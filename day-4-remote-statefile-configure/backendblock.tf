# To store the statefile and apply the locking mechanism

#backend block

terraform {
  backend "s3" {
    bucket = "statefile-createded-in-s3bucket"
    key    = "terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "bucket-statefile-lock-dynamo" # DynamoDB table used for state locking, note: first run day-4-creates3-and-lockingprocess
    encrypt        = true  # Ensures the state is encrypted at rest in S
  }
}