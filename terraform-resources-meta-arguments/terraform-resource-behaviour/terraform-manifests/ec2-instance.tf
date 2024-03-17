resource "aws_instance" "ec2_pract" {

  ami           = "ami-0ff8a91507f77f867"
  instance_type = "t2.micro"
  #availability_zone = "us-east-1a" # we'll change this availability zone to test the "Delete & Recreate" behaviour
  availability_zone = "us-east-1b" # When applying, terraform will destroy and recreate the instance in us-east-1b
  tags = {
    "Name" = "ResourceBehaviourTest" # We'll add a tag name to test "Update-in-place behaviour"
    "Tag"  = "AddedToCheckBehaviour" # changed.. new tag is added
  }

}

# Desired State: The state that is configured in your terraform configuration file
# Current State: Whatever is present in AWS infrastructure currently