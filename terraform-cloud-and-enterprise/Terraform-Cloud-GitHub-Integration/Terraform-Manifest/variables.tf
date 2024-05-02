variable "region" {
  #default     = "us-east-1" # This variable is added to terraform cloud variables
  type        = string
  description = "this is the region"

}

variable "app_name" {
  default     = "web_app"
  type        = string
  description = "this is application name"

}

variable "instance_type" { # This variable is added to terraform cloud variables
  # default     = "t2.micro"
  type        = string
  description = "this is instance type"

}

variable "environment_name" {
  default     = "dev"
  description = "Dev Environment"
  type        = string

}
