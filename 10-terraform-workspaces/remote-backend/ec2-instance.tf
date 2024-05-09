resource "aws_instance" "ec2-from-datasource" {

  ami           = data.aws_ami.amazon_linux_ami.id # This is fetched from AMI data-source
  instance_type = var.instance_type
  key_name      = "instanceBy_terraform"
  # For non-default workspace, it may be useful to spin up smaller instances
  count                  = terraform.workspace == "default" ? 2 : 1 # It will create 2 instance if we are in Default workspace else for any other workspace it will create 1 instance
  user_data              = file("apache-install.sh")
  vpc_security_group_ids = [aws_security_group.ssh-SG.id, aws_security_group.web-SG.id]
  tags = {
    Name = "${terraform.workspace}-instance-${count.index}" # tag will also be named as per the workspace we'll be working in.

  }

}