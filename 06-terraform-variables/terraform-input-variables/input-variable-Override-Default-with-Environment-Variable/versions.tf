terraform {
  required_version = "~>1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.0"
    }
  }
}

provider "aws" {
  region  = var.aws_region # Region is variablized
  profile = "default"

}

provider "aws" {
  region  = var.aws_alias_region # alias region is variablized
  profile = "default"
  alias   = "us-west-1-region"

}