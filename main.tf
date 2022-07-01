#Providers
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket = "bucket_name" #Choose random name
    key = "terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    
  }
}