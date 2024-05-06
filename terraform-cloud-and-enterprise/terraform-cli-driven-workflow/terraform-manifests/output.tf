output "bucket_name" {
  description = "bucket name of static website"
  value       = module.s3_static_website_module.bucket_domain_name

}

output "arn" {
  description = "ARN of bucket"
  value       = module.s3_static_website_module.arn

}

output "bucket_domain_name" {
  description = "domain name"
  value       = module.s3_static_website_module.bucket_domain_name

}

output "bucket_regional_domain_name" {
  value       = module.s3_static_website_module.bucket_regional_domain_name
  description = "regional domain"

}
# output "static_website_url" {
#   description = "website url"
#   value       = "http://${aws_s3_bucket.static_website_bucket.bucket}.s3-website-${aws_s3_bucket.static_website_bucket.region}.amazonaws.com"


# }