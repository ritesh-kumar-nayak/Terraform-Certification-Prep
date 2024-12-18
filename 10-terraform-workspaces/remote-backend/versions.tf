terraform {
  required_version = "~>1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.0"
    }
  }
  backend "s3" {

    bucket = "terraform-statelocking-bucket"
    key = "terraform-workspace-test/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-dev-state-table"
    
  }
}

provider "aws" {
  region  = var.region
  profile = "default"

}

/* Here the the terraform.tfstae.d folder will be migrated to S3 bucket with the name "env:/" */