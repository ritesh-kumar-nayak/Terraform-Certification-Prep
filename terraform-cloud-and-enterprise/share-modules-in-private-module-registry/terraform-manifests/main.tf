module "s3_static_website_module" {
  source  = "app.terraform.io/HCTA-Prep/s3_static_website_module/aws"
  version = "1.0.2"
  bucket_name = "test-module-1234"
  index_file = "index.html"
  
}


/* We can not call the modules in a private registry directly. To call the module you need authorization
which we can get using : "terraform login" command from CLI which will further take you to terraform webpage and ask you to generate the token. 
Once token is generated, paste the token in you CLI*/