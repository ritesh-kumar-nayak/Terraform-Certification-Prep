# It contains all the most used blocks of terraform
######################################################

# Block -1 : Terraform Settings Block
#-------------------------------------#
terraform {
  required_version = "~> 1.7.4"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 3.0"
    }
  }
  # Adding backend as S3 for Remote State Storage with State Locking

  backend "s3" {
    bucket = "test-bucket859655"
    key = "dev2/terraform.tfstate"
    region = "us-east-1"

    # For State Locking
    dynamodb_table = "terraform-dev-state-table" 
  }
}

# Block-2: Provider Block
#-------------------------#
provider "aws" {

    profile = "defaulr" ## AWS Credentials Profile configured on your local desktop terminal  $HOME/.aws/credentials
    region = "us-east-1"
  
}

# Block-3: Resource Block
#--------------------------#

resource "aws_instance" "demo-EC2" {
    ami = "ami-0440d3b780d96b29d"
    instance_type = var.instance_type

}

# Block-4: Input Variables
#--------------------------#

variable "instance_type" {
  default = "t2.micro"
  description = "Ec2 instance type"
  type = string

}

variable "app_name" {
    default = "some_app"
    description = "Application Name"
    type = string
  
}

variable "environment_name" {
    default = "Prod"
    description = "Production Environment"
    type = string
  
}

# Block-5: Output Values Block
#-----------------------------#

output "ec2_instance_public_ip" {
    description = "Ec2 Instance Public Ip"
    value = aws_instance.demo-EC2.public_ip

}

# Block-6: Local Values Block
    #Create S3 Bucket with Input Variables and Local Values
locals {
  bucket-name-prefix = "${var.app_name}-${var.environment_name}"
}

# Block-7: Data Sources Block
#-------------------------------#
# Get Latest AMI ID for amazon Linux2 OS

data "aws_ami" "amzlinux" {
    most_recent = true
    owners = [ "amazon" ]

    filter {
      name = name
      values = [ "amzn2-ami-hvm-*" ]
    }
    filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

}

# Block-8: Modules Block
#------------------------#
#AWS Ec2 Instance Module

module "ec2_cluster" {
    source = "terraform-aws-modules/ec2-instance/aws"
    version = "~> 2.0"

    name = "my-module-demo"
    instance_count = 2

    ami = data.aws_ami.amzlinux.id
    instance_type = var.instance_type
    key_name = "terraform-key"
    monitoring = true
    vpc_security_group_ids = ["sg-02fa04b5060a611cf"] # Get Default VPC Security Group ID
    subnet_id = "subnet-0f1f2811c48ae37d1"      # Get one public subnet id from default vpc
    user_data = file("apacheinstall.sh")

    tags = {
        Terraform = "true"
        Environment = var.environment_name
    }

  
}
