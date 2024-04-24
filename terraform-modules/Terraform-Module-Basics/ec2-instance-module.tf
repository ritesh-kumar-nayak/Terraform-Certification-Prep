module "ec2-instance-demo" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.1"

  name          = "instance_demo-${terraform.workspace}" # Name will change based on the workspace
  ami           = data.aws_ami.amazon_linux_ami.id
  instance_type = var.instance_type
  count = 2

  monitoring             = false
  vpc_security_group_ids = ["sg-0572861b2c7f65b90"]   # Default SG
  subnet_id              = "subnet-069b675221e2dc4c7" # Subnet from Default SG VPC
  key_name               = "instanceBy_terraform"
  user_data = file("apache-install.sh")

  tags = {
    name        = "module_demo"
    Environment = "dev"
    Terraform   = "true"
  }
  

}
resource "time_sleep" "wait_90_second" {
  depends_on = [ module.ec2-instance-demo ]
  create_duration = "90s"
  
}