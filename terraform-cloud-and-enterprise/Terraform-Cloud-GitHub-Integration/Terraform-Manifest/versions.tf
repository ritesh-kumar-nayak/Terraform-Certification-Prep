terraform {
  #required_version = "~>1.5.0" # this is for local version
  required_version = "~>1.8.2" # This is for execution on terraform cloud
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.0"
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
  region = var.region

}

/* Here the the terraform.tfstae.d folder will be migrated to S3 bucket with the name "env:/" 
  #profile = "default"   profile is commented as we are executing on terraform cloud 

  The environment variable key has to be in below format and their respective values has to be pasted in value section:

    AWS_ACCESS_KEY_ID 
    AWS_SECRET_ACCESS_KEY

*/