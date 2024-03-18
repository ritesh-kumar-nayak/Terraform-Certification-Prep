resource "aws_instance" "instance-for-lifecycle-demo" {
  ami               = "ami-0d7a109bf30624c99"
  instance_type     = "t2.micro"
  #availability_zone = "us-east-1a" #we'll change this AZ with "create_before_destory" meta-arg post apply to observe the change in resource behaviour
 
  availability_zone = "us-east-1b" # This will be the second AZ
  tags = {
    Name    = "web-01"
    "usage" = "create_before_destroy_test"
  }

  # Lifecycle resource Meta-Argument
  lifecycle {
    create_before_destroy = true # This will first create the resource and then delete the existing resource.
  }

} 