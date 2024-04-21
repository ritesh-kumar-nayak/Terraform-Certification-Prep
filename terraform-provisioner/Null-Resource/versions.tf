terraform {
  required_version = "~>1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.0"
    }

    null = {
      source  = "hashicorp/null"
      version = "3.2.2"
    }

    time = {
      source  = "hashicorp/time"
      version = "0.11.1"
    }
  }
  backend "s3" {

    bucket         = "terraform-statelocking-bucket"
    key            = "terraform-workspace-test/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-dev-state-table"

  }
}

provider "aws" {
  region  = var.region
  profile = "default"

}
provider "null" {
  # Configuration options

}

/* null provider is declared along with aws provider. 
The primary use-case for the null resource is as a do-nothing container for arbitrary actions taken by a provisioner. */