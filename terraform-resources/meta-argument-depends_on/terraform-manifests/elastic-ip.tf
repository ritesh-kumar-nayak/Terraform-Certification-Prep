# Elastic IP can be created only if Internet Gateway exists
# Here we'll use depends_on meta argument to set an explicit dependency on the IGW

resource "aws_eip" "terra-eip" {
  instance = aws_instance.my-ec2-vm.id
  #vpc      = true

  # Meta Argument is defined here

  depends_on = [aws_internet_gateway.vpc_dev_igw]

}