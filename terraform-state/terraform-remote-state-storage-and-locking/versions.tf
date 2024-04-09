terraform {
  required_version = "~>1.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.0"

    }
  }
  # Adding backend as S3

  backend "s3" {
    bucket = "terraform-statelocking-bucket"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"

    # DynamoDB for State-Locking
    dynamodb_table = "terraform-dev-state-table"
  }

}

provider "aws" {
  region  = var.region
  profile = "default"

}