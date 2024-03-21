
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
  default = "t2.micro"    # This value will be overreiden on CLI
  type        = string
  description = "this defines type of instance"

}

variable "instance_count" {
  default     = 2
  type        = number
  description = "this is number of variables"

}
/* 

NOTE: We can also override variable by using Envoronment variables using below syntax.
Syntax: export TF_VAR_variable_name=value

Example: export TF_VAR_instance_type=t2.large
         export TF_VAR_instance_count=6
Export command from CLI will store the variables in our local machine. You have to export it before terraform plan or terraform apply

We can aslo do : echo $TF_VAR_instance_type , $TF_VAR_instance_count to cross verify from CLI

Now our default instance type and instance count will be overriden with t2.large and 6 respectively.

Once we unset the environment variables it will pick value from this variable.tf
We can clear the environment variables using:
  unset TF_VAR_instance_type
  unset TF_VAR_instance_count
*/