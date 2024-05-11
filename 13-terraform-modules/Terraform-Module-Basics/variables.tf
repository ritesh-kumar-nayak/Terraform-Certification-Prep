variable "region" {
  default     = "us-east-1"
  description = "this is the region"

}

variable "app_name" {
  default     = "web_app"
  type        = string
  description = "this is application name"

}

variable "instance_type" {
  default     = "t2.micro"
  type        = string
  description = "this is instance type"

}

variable "environment_name" {
  default     = "dev"
  description = "Dev Environment"
  type        = string

}
