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

/* I have made 3 changes for workspace demonstration:
  Change1: In aws we can't create multiple SG with a same name. Hence I have modified the SG name according to the workspace that am going to do terraform apply
  
  Change2: to avoid creating more than necessary instances for lower environments such as Dev, Qa and UAT, I have modified the "count" meta argument to pass the count based on the Workspace we are doing terraform apply
  
  Change3: Modified the tags as per workspace
  change4: modified the output file to output all ARN for all the instances using [*]  */