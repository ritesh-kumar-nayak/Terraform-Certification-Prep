resource "aws_instance" "ec2-for-vars" {

  ami                    = var.ami_linux     # We can variablize this argument
  instance_type          = var.instance_type # We can variablize this argument
  key_name               = "instanceBy_terraform"
  count                  = var.instance_count # this can be variablize
  
  tags = {
    Name = "ec2-vars"
  }

}