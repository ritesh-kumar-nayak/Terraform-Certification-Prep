variable "region" {
  default     = "us-east-1"
  description = "this is the region"

}

variable "app_name" {
  default     = "web_app"
  type        = string
  description = "this is application name"

}

variable "environment_name" {
  default     = "dev"
  description = "Dev Environment"
  type        = string

}
