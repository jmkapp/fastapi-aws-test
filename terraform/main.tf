provider "aws" {
  region = "eu-west-2"
}

resource "aws_cognito_user_pool" "user_pool" {
  name = "fastapi-aws-test"
}

resource "aws_cognito_user_pool_client" "fastapi_client" {
  name         = "fastapi-client"
  user_pool_id = aws_cognito_user_pool.user_pool.id

  generate_secret = false

  explicit_auth_flows = [
    "ALLOW_USER_PASSWORD_AUTH",
    "ALLOW_REFRESH_TOKEN_AUTH",
  ]

  access_token_validity  = 1   # hours
  refresh_token_validity = 30  # days

  prevent_user_existence_errors = "ENABLED"
}

resource "aws_ecr_repository" "fastapi_ecr" {
  name = "fastapi-ecr"
}

resource "aws_cognito_user" "test_user" {
  username         = "fastapi"
  user_pool_id = aws_cognito_user_pool.user_pool.id
}

# User is created with FORCE_CHANGE_PASSWORD status so must be changed:
# aws cognito-idp admin-set-user-password \
#   --user-pool-id YOUR_POOL_ID \
#   --username fastapi \
#   --password Perm1234! \
#   --permanent