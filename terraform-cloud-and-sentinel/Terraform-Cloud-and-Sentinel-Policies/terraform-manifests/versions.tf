terraform {
  required_version = "~>1.5"
  required_providers {
    aws= {
        source ="hashicorp/aws"
        version = ">=5.0"
    }
  }
  cloud {
    organization = "HCTA-Prep"

    workspaces {
      name = "Cloud-Sentinel"
    }
  }

  # backend "s3" {
  #   bucket = "terraform-statelocking-bucket"
  #   key = "state-command/terraform.tfstate"
  #   region = "us-east-1"
  #   dynamodb_table = "terraform-dev-state-table"
  # }
}

provider "aws" {
    region = "us-east-1"
   # profile = "default"
  
}

# Here we have created the "plan-v1.out" file to test our commands on it

# "terraform show plan-v1.out" wiill display output in a human readable format
# "terraform show" will display the default state  file created locally / in remote backend

