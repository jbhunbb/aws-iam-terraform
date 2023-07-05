terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# 기본적으로 $HOME/.aws/ 하위 config 및 credential에 profile 을 선언할 수 있으며, 기본적으로 해당 파일들을 읽어옴
provider "aws" {
  region = "us-east-1"
  profile = "bhji"
}