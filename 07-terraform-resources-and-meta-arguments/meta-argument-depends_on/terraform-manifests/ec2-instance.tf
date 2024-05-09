resource "aws_instance" "my-ec2-vm" {
  ami                    = "ami-0d7a109bf30624c99"
  instance_type          = "t2.micro"
  key_name               = "sample-key1"
  subnet_id              = aws_subnet.vpc-dev-public-subnet-1.id
  vpc_security_group_ids = [aws_security_group.dev-SG.id]

  user_data = file("apache-install.sh") # file() reads the content present inside that file

  # Below is another way of defining user data
  # user_data = <<-EOF
  #     #! /bin/bash
  #     sudo yum update -y
  #     sudo yum install -y httpd
  #     sudo service httpd start
  #     sudo systemctl enable httpd
  #     echo "<h1> Welcome to DevOps With Ritesh ! AWS Infra Created using Terraform in US-east-1 </h1>" > /var/www/html/index.html
  # EOF
}