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
  access_key = "AKIAVU53PT5HVCFX2IVG"
  secret_key = "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"
}