
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

NOTE: Syntax: terraform -apply -var="variable_name=new_value" -var="variable_nmae2=new_value2"
      terraform plan -var="instance_type=t2.small" -var="instance_count=4" 
      terraform apply -var="instance_type=t2.small" -var="instance_count=4"

Using the above way we can override the variable default value at the run time via CLI.

We can also use :

 "terraform plan -var="instance_type=t2.small" -var="instance_count=4" -out plan.out" command to save the plan and apply next time
 It will create a plan file for us.

 then we can directly use "terraform apply plan.out" 

*/
