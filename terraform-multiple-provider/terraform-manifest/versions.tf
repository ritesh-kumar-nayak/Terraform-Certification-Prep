terraform {
  required_version = "~>1.5.0"
  required_providers {
    aws ={
        source = "hashicorp/aws"
        version = "~>3.6.0"
    }
  }
}


# Provider for us-east-1 region
provider "aws" {
    region = "us-east-1"
    profile = "default"
  
}

# Provider for us-west-1
provider "aws" {
  region = "us-west-1"
  profile = "default"

  alias = "us-west-1-provider" # alias are used for using same provider with different configuration

}