resource "aws_instance" "ec2_web" {
    ami = "ami-0ce6d733b60360890"
    instance_type = "t2.micro"
    #key_name = "sample-key1"
    provider = aws.us-west-1-region
    count = 2
    ebs_block_device {
    device_name           = "/dev/sdf"
    volume_size           = 20
    volume_type           = "gp2"
    delete_on_termination = true
  }

    tags = {
        "1stName"="EC2"
        "Name" = "web-${count.index}"  # this will act as a tag as well as the name of the instance
    }
  
}