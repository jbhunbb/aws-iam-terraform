terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  profile = "bhji"
}


data "aws_iam_user" "example" {
  user_name = "bhji@cloudbric.com"
}