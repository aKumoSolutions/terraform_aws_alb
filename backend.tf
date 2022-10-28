terraform {
  backend "s3" {
    bucket         = "aws-session-may2022-remote-backend-kris"
    region         = "us-west-2"
    key            = "alb/terraform.tfstate"
    dynamodb_table = "terraform-may2022-state-lock-table" # State locking can be done by DynamoDB table on AWS
  }
}