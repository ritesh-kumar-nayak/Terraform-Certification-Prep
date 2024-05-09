
# These are input variables
variable "aws_region" {
  description = "this will contain region"
  type        = string
  default     = "us-east-1"

}

variable "aws_alias_region" {
  default     = ["us-west-1", "us-west-1"]  # variables are declared as a list of string

  description = "This is for multiple provider usecase"
  type        = list(string) # list of string is the type of variable

}

variable "ami_linux" {
  default     = "ami-0d7a109bf30624c99"
  description = "this is amazon linux ami id"
  type        = string

}

variable "instance_type" {

  default = ["t2.micro", "t3.micro", "t3.large"] # Here we are declaring variables as a list
  type    = list(string)                         # "list of string" is the type of variable here

  description = "this defines type of instance"

}

variable "instance_count" {
  default     = [2, 3, 4, 5]
  type        = list(number) # here the type is number
  description = "this is number of variables"

}
/* 

  NOTE: Here we can declare default values of a variable in a list format withing []
  These are further refered by their index number
  syntax:
    var.instance_count[0]
    var.instance_type[1]
    
*/