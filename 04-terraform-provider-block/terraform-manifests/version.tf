# Terraform Block

terraform {
  required_version = "~>1.5.0"
  required_providers {
    aws={
        source = "hashicorp/aws"
        version = "~>3.0"
    }
  }
}

provider "aws" {
    region = "us-east-1"
    profile = "default"
  
}

/* AWS Credential Profile ( profile = "default") is configured on your local desktop.
you can see the profile by using the "aws configure list-profiles" command. By default, these files are located at $HOME/.aws/config and $HOME/.aws/credentials on Linux and macOS, 
and "%USERPROFILE%\.aws\config" and "%USERPROFILE%\.aws\credentials" on Windows.*/

