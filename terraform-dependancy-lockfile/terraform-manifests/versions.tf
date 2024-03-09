terraform {
  required_version = "~>1.5.0"
  required_providers {
    aws = {
        version = ">=5.0" # this will give us aws version between 5.0.1 and 5.2.0. however we have to upgrade using "terraform init -upgrade" if we used older version previously
        source = "hashicorp/aws"
    }
    
    random = {
        source = "hashicorp/random"
        version = "3.0.0"
    }

  }
}

provider "aws" {

  region = "us-east-1"
  profile = "default"
  
}