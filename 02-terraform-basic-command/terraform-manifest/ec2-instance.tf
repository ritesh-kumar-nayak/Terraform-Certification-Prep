# Terraform Settings Block

terraform {
  required_providers {
    aws= {
        source = "hashicorp/aws"
        #version = "~> 1.7.4" #optional but recomended in production

    }
  }
}

# Provider Block

provider "aws" {

    profile = "default" # AWS Credential profile configured in your local machine terminal $HOME/.aws/credentials
    region = "us-east-1"
}

# Resource block

resource "aws_instance" "ec2Demo" {

    ami = "ami-0440d3b780d96b29d"   # Amazon Linux Machine Image in us-east-1 region
    instance_type = "t2.micro"
  
}