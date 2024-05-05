terraform {
  required_version = "~>1.5.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0"
    }
  }
  backend "s3" {
    key    = "dev/terraform.tfstate"
    bucket = "terraform-statelocking-bucket"
    region = "us-east-1"
    # For locking
    dynamodb_table = "terraform-dev-state-table"

  }

}

provider "aws" {
  region  = "us-east-1"
  #profile = "default"
}


