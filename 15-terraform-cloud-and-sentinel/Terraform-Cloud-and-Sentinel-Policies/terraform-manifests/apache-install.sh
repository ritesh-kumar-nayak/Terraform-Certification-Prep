#! /bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo service httpd start
sudo systemctl enable httpd
echo "<h1> Welcome to DevOps With Ritesh ! AWS Infra Created using Terraform in US-east-1 </h1>" > /var/www/html/index.html

