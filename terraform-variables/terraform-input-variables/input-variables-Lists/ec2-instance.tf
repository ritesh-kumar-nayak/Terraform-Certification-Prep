resource "aws_instance" "ec2-for-vars" {

  ami = var.ami_linux # We can variablize this argument

  instance_type = var.instance_type[1] # Here we are refering the the value of the variable with it's index number

  key_name = "instanceBy_terraform"
  count    = var.instance_count[2] # this is variablized with index number of instace_count

  tags = {
    Name = "ec2-vars"
  }

}