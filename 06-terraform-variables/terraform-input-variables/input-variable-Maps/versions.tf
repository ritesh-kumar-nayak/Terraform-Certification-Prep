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
  region  = var.aws_region["UAS-East"] # Region is variablized with Map type variable
  profile = "default"

}

provider "aws" {
  region  = var.aws_alias_region[0] # here we are refering the variable value with it's index number
  profile = "default"
  alias   = "us-west-1-region"

}