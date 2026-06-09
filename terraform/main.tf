provider "aws" {
  region = "eu-west-2"
}

resource "aws_ecr_repository" "fastapi_ecr" {
  name = "fastapi-ecr"
}