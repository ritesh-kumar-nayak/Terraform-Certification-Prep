
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

}

variable "instance_type" {
  default = "t2.micro"    # this default value will be overriden by the count value declared in terraform.tfvars
  type        = string
  description = "this defines type of instance"

}

variable "instance_count" {
  default     = 2
  type        = number
  description = "this is number of variables"

}
/* 

  NOTE: We can also override variable by naming the variable file as file_name.auto.tfvars which is present in the current directory.
It will be auto-loaded just like terraform.tfvars however, it helps in organizing variables in much better way.

*/