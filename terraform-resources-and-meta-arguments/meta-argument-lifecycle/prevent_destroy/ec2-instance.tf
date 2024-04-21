resource "aws_instance" "instance-for-lifecycle-demo" {
  ami               = "ami-0d7a109bf30624c99"
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"

  tags = {
    Name    = "web-01"
    "usage" = "create_before_destroy_test"
  }

  # Lifecycle resource Meta-Argument
  lifecycle {

    prevent_destroy = true # This should prevent the destruction of the resource even if we apply "terraform destroy" command. Default is set to false

  }

}

# This resource will test how to proceed with the destruction of other resources ignoring the error caused by the above resource while destroying.
resource "aws_instance" "instance-for-lifecycle-demo-2" {
  ami               = "ami-0d7a109bf30624c99"
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"

  tags = {
    Name    = "web-02"
    "usage" = "create_before_destroy_test"
  }

}

# NOTE: We can use "terraform destroy -target=aws_instance.instance-for-lifecycle-demo-2" to destroy the second instance 

/*If you have multiple instances that you want to destroy while ignoring errors related to the lifecycle.prevent_destroy attribute,
 you can use the -target flag multiple times to specify each resource individually. Alternatively, you can use the -target flag to
  specify a resource and then exclude the resource with lifecycle.prevent_destroy using the -target flag again.
  Example:
  -----------
  terraform destroy \
  -target=aws_instance.instance1 \
  -target=aws_instance.instance2 \
  -target=aws_instance.instance3 \
  ...

  
  */