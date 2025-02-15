terraform {
  backend "s3" {
    bucket         = "terraform-backend-bucket" 
    key            = "terraform/aws/terraform.tfstate"
    region         = "ap-northeast-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}