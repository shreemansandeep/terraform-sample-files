terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
    access_key = "AKIAX5PX2KOF4JZRXSM5"
    secret_key = "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"
    region = "ap-south-1"
}