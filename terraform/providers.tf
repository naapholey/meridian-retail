terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "Hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  profile = "meridian"
}