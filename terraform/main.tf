terraform {
  required_version = ">= 1.10.0"

  backend "s3" {
    bucket       = "fast-api-aws-test-tfstate"
    key          = "fastapi-aws-test/terraform.tfstate"
    region       = "eu-west-2"
    encrypt      = true
    use_lockfile = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}

resource "aws_ecr_repository" "fastapi_ecr" {
  name = "fastapi-ecr"
}