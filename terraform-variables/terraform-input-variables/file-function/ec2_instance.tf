resource "aws_instance" "ec2-instance_1" {
  ami = ""
  instance_type = "t2.micro"
  user_data = file("apache.sh")     # this is how we pass files. Here the content of apache.sh will be passed as user data.associate_public_ip_address.
  
  key_name = "instanceBy_terraform"

  tags = {
    "Name"="test-file-function"
  }
}