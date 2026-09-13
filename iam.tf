terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "my_user" {
  name = "terraform-user"

  tags = {
    Name = "Terraform IAM User"
  }
}
