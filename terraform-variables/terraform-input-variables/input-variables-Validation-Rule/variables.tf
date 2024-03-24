
# These are input variables
variable "aws_region" {
  description = "this will contain region"
  type        = string
  default     = "us-east-1"

}

variable "aws_alias_region" {
  default     = "us-west-1"
  description = "This is for multiple provider usecase"
  type        = string

}

variable "ami_linux" {
  default     = "ami-0d7a109bf30624c99"
  description = "this is amazon linux ami id"
  type        = string

# Here we are defining validation rule
  validation {
    condition = length(var.ami_linux)>4 && substr(var.ami_linux,0,4)=="ami-"    # this condition will be evaluated while terraform plan/apply
    error_message = "AMI ID should be a valid one starting with \"ami-"
  }

}

variable "instance_type" {
  default     = "t2.micro"
  type        = string
  description = "this defines type of instance"

}

variable "instance_count" {
  default     = 1
  type        = number
  description = "this is number of variables"

}

/*
Validation rules in input variables allow us to ensure that our infrastructure configuration adhere to specific
requirements or constraints that are not covered by Terraform built-in validation rule
*/