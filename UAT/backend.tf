terraform {
  backend "s3" {
    bucket = "ordinaryjoe-uat-bucket"         #Create your s3 bucket 
    key    = "path/to/terraform.tfstate"  # Define your desired path for the state file within the bucket
    region = "us-west-2"                  # Define the appropriate AWS region
    dynamodb_table = "ordinaryjoe-uat-db"     # Your DynamoDB table name for state locking
    encrypt = true                        # Enable encryption for the state file
  }
}
