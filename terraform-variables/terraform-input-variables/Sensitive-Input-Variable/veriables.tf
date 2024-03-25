variable "region" {
  type        = string
  default     = "us-east-1"
  description = "region"

}

variable "rds_username" {
  type        = string
  description = "this is sensitive username"
  sensitive   = true # As this is a sensitive variable we are not exposing it in this variable.tf, keeping no default value

}

variable "rds_password" {
  type        = string
  description = "this is sensitive password"
  sensitive   = true # As this is a sensitive variable we are not exposing it in this variable.tf, keeping no default value
}
# The secret credentials will be driven from secrets.tfvars file will will be put in .gitignore 