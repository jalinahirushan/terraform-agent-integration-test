terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

variable "aws_region" {
  type = string
}

provider "aws" {
  region = var.aws_region
}

resource "aws_dynamodb_table" "broken" {
  name         = "semantic-agent-ci-test"
  billing_mode = "PAY_PER_REQUEST"

  # Deliberately incorrect: does not match customer_id below.
  hash_key = "customerId"

  attribute {
    name = "customer_ID"
    type = "S"
  }
}
