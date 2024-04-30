# Call the custom terraform module here
module "static_website_custom_module" { # this name can be anything

  source      = "../Build-Terraform-Module-to-Host-Static-Website/modules/aws_s3_static_website_bucket"
  bucket_name = var.s3_bucket_name
  tags        = var.s3_tags
  index_file = var.index_file

}