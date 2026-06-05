provider "aws" {
  region = "eu-west-2"
}

resource "aws_cognito_user_pool" "user_pool" {
  name = "my_user_pool"
}