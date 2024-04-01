
locals {
  bucket_name = "${var.app_name}-${var.environment_name}-bucket"
}

/* resource "aws_s3_bucket" "dev_bucket" {
  bucket = "${var.app_name}-${var.environment_name}-bucket" /*This is a complex and long expression whcih can be repeated in multiple places. In furure if there is anychanges in bucket name then we'll have to change in all respective places. Now, to avoid that we can use Local values as below 

  tags = {
    Name        = "${var.app_name}-${var.environment_name}-bucket"
    Environment = "${var.environment_name}"
  }

}*/

resource "aws_s3_bucket" "dev_bucket" {
  bucket = local.bucket_name # Here we have replaced the lengthy expression with a local value that contains the expression

  tags = {

    Name        = local.bucket_name
    Environment = "${var.environment_name}"

  }

}