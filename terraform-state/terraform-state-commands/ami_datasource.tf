data "aws_ami" "amazon_linux_ami" {
    most_recent = true
    owners = [ "amazon" ]
    filter {
    name   = "name"
    values = ["al2023-ami-*"] # This expression needs to be very specific
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}