resource "aws_instance" "ec2-for-state-demo" {

  ami                    = data.aws_ami.amazon_linux_ami.id # This is fetched from AMI data-source
  instance_type          = var.instance_type
  key_name               = "instanceBy_terraform"
  count                  = 1 # this can be variablize
  user_data              = file("apache-install.sh")
  vpc_security_group_ids = [aws_security_group.ssh-SG.id, aws_security_group.web-SG.id]
  tags = {
    "Name" = "Cloud_Sentinel_Demo"
    "taged" = "Manually"  
    "target_tag"="Target-option-testing"
    #"taged" = "Manually"  added this tag manually from the console. Now when I refresh, only the statefile present in S3 bucket will be update.
  }
  # lifecycle {
  #   ignore_changes = all
  # }

}

# This below resource is created to test -target option
resource "aws_instance" "instance_for_target_testing" {

  ami                    = data.aws_ami.amazon_linux_ami.id # This is fetched from AMI data-source
  instance_type          = var.instance_type
  key_name               = "instanceBy_terraform"

}