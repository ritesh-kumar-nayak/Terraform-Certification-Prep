resource "aws_instance" "instance-for-lifecycle-demo-3" {
  ami               = "ami-0d7a109bf30624c99"
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"

  tags = {
    Name = "web-03"

    # We'll add a tag manually from the aws console to observe the behaviour change.
  }

  # Lifecycle resource Meta-Argument
  lifecycle {

    # ignore_changes = [ tags ] # this is one way
    ignore_changes = all # this is second way of using ignore_changes

  }

  /*
    Important Note: Instead of a list, the special keyword all maybe used to instruct Terraform to ignore all attributes,
   which means that Terraform can create and destroy the remote object but will never propose updates to it.
   */

}

/* When we make changes manually from the console that are not present in terraform configuration it will give us the below during plan
    ~ tags_all                             = {
          - "Webserver" = "Apache" -> null
            # (1 unchanged element hidden) 
            
    And it will delete the changes done manually when, we apply to match the infrastructure state with configuration file state
    There might be some critical changes that was needed to be done manually from console so, 
    To avoid this deletion we have to use the "ignore_changes" meta-argument
            */