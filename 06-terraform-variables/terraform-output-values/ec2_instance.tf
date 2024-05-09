resource "aws_instance" "instance_for_opv" {
  ami                    = var.ami_linux
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.ssh-SG.id, aws_security_group.web-SG.id]
  key_name               = "instanceBy_terraform"

  user_data = file("apache-install.sh")

  tags = {
    Name = "Instance_for_Opvd"
    type = "Temp"
  }
}