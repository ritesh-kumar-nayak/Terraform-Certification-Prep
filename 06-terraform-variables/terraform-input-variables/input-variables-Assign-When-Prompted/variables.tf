
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

/* In instance type variable we are not assigning any default value so that it will ask
 for the value while applying the configuration using terraform apply or even terraform plan */

/*  
    $ terraform plan
    var.instance_type
    this defines type of instance
    Enter a value: t3.large

This will ask for vallues like the above !

*/

variable "instance_type" {
  
  type        = string
  description = "this defines type of instance"

}

variable "instance_count" {
  default     = 2
  type        = number
  description = "this is number of variables"

}

