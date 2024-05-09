
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
  default     = "t2.micro"
  type        = string
  description = "this defines type of instance"

}

variable "instance_count" {
  default     = 2
  type        = number
  description = "this is number of variables"

}

