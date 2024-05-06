terraform {
  
  # Terraform cloud block to establish the connection between CLI and terraform cloud Org and Workspace
  
  cloud {
    organization = "HCTA-Prep"

    workspaces {
      name = "CLI_Driven"
    }
  }
  required_version = ">=1.5.1"
  #required_version = "~>1.8.2"  # version supported by Terraform Cloud
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0"
    }
  }


  # as we are using terraform cloud, we do not need to declare the backend block explicitly. Hence, commenting it out.
  # backend "s3" {
  #   key    = "dev/terraform.tfstate"
  #   bucket = "terraform-statelocking-bucket"
  #   region = "us-east-1"
  #   # For locking
  #   dynamodb_table = "terraform-dev-state-table"

  # }

}

provider "aws" {
  region  = "us-east-1"
  #profile = "default"
}

/* 
Additionally a cloud block is added which contains the Organization name and Workspace name as 
attribut. This block enables terraform CLI to connect to Terraform cloud for executing terraform plan apply etc..
We do not need to declare explicit backend block as terraform cloud handles storig state files by default.
*/


