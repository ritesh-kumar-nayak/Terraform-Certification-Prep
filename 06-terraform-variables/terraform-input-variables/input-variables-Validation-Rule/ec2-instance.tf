resource "aws_instance" "ec2-for-vars" {

  ami                    = var.ami_linux     # We can variablize this argument
  instance_type          = var.instance_type # We can variablize this argument
  key_name               = "instanceBy_terraform"
  count                  = var.instance_count # this can be variablize
  user_data              = file("apache-install.sh")
  vpc_security_group_ids = [aws_security_group.ssh-SG.id, aws_security_group.web-SG.id]
  tags = {
    Name = "ec2-vars"
  }

}