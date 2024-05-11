# All output will be defined here. 
# These Output values are being refered from the "output.tf" of module
# So, whatever the output that are exposed from the module can be called as output here as well.

output "name" {
  value       = module.static_website_custom_module.bucket_name
  description = "bucket name where website is hosted"
}

output "arn" {
  value       = module.static_website_custom_module.arn
  description = "bucket ARN"

}

output "bucket_domain_name" {
  value       = module.static_website_custom_module.bucket_domain_name
  description = "bucket domain"

}

output "bucket_regional_domain_name" {
  value       = module.static_website_custom_module.bucket_regional_domain_name
  description = "regional domain"

}

output "static_website_url" {
  value       = module.static_website_custom_module.static_website_url
  description = "static website url that is constructed inside moduke as output is being called here"

}
