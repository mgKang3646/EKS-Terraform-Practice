terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-2"
  access_key = "AKIAVU53PT5HQFPLZH7N"
  secret_key = "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"
}