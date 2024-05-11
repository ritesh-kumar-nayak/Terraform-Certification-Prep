# Call the custom terraform module here
module "static_website_custom_module" { # this name can be anything

  source      = "../Build-Terraform-Module-to-Host-Static-Website/modules/aws_s3_static_website_bucket"
  bucket_name ="bucket-${formatdate("YYYY-MM-DD", timestamp())}-${random_id.bucket_suffix.hex}"
  tags        = var.s3_tags
  depends_on = [ random_id.bucket_suffix ]
  index_file = var.index_file

}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}
