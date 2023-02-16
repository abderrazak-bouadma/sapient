provider "aws" {
  region = "us-east-1"
  access_key = $AWS_ACCESS_KEY
  secret_key = $AWS_SECRET_KEY
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.46"
    }
  }
}
