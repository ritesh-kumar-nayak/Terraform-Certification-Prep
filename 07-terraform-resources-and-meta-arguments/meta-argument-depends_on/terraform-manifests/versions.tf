# Terraform block
terraform {
  required_version = "~>1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.0"
    }
  }
}

# Provider Bloc

provider "aws" {
  region  = "us-east-1"
  profile = "default"

}

provider "aws" {
  region  = "us-west-1"
  profile = "default"
  alias   = "us-west-1-region"

}