variable "region" {
  default     = "us-east-1"
  description = "this is the region"

}

variable "ami_linux" {
  default     = "ami-0d7a109bf30624c99"
  description = "this is image id"

}

variable "instance_type" {
  default     = "t2.micro"
  description = "type of the instance"

}
