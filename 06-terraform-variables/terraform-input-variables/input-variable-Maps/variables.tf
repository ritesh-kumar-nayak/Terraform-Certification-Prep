
# These are input variables
# variable "aws_region" {
#   description = "this will contain region"
#   type        = string
#   default     = "us-east-1"

# }

# variable "aws_alias_region" {
#   default     = ["us-west-1", "us-west-1"]  # variables are declared as a list of string

#   description = "This is for multiple provider usecase"
#   type        = list(string) # list of string is the type of variable

# }

variable "aws_region" {
  type = map(string)
  default = {
    "UAS-East" = "us-east-1"
    "UAS-West"="us-west-1"
  }
}

variable "ami_linux" {
  default     = "ami-0d7a109bf30624c99"
  description = "this is amazon linux ami id"
  type        = string

}

/*variable "instance_type" {

  default = ["t2.micro", "t3.micro", "t3.large"] # Here we are declaring variables as a list
  type    = map(string)                       # "list of string" is the type of variable here

  description = "this defines type of instance"

}*/

variable "instance_type" {

  default = {
    "small_app"  = "t2.micro"
    "medium_app" = "t3.medium"
    "large_app"  = "t3.large"
  } # Here we are declaring variables as key value pair because we are using map type

  type = map(string) # "map of string" is the type of variable here

  description = "this defines type of instance in a map as key-value pair"

}

variable "instance_count" {
  default     = [2, 3, 4, 5]
  type        = list(number)
  description = "this is number of variables"

}

variable "instance_tags" {  # Created tags variable as Map

  type = map(string)
  default = {
    "Name"="Ec2_Instance_app"
    "Location"="US"
    "Role"="Temp"

  }
  
}
/* 

  NOTE: Variables are declared in Map type which are in key-value pair
  we can refer to these variables by their key name.
*/