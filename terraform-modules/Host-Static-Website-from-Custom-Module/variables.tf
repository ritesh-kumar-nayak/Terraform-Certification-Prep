variable "s3_bucket_name" {
  type        = string
  description = "Name of the S3 bucket"
}

variable "s3_tags" {
  type    = map(string)
  default = {}

}

variable "region" {
  description = "s3 region"
  type        = string

}

variable "index_file" {
  default = "index.html"
  description = "this is the webpage name which will be uploaded to bucket"
  
}
# NOTE: The values to these variables are being defined/assigned in terraform.tfvars file
