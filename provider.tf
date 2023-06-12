terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
    access_key = "ADDAK"
    secret_key = "ADDSK"
    region = "ap-south-1"
}
