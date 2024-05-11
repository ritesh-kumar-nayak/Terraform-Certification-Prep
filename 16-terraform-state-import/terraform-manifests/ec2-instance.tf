resource "aws_instance" "ec2_vm" {
    /* 
    
    This block is written after importing the tfstate file using the command "terraform import aws_instance.ec2_vm i-06abe083645920b37"
    Once the command is executed, tfstate file got created and this ec2-instance.tf file is written by referring to the generated tfstate file.
    In case of aws_instance resource, instance_id is the unique identifier on the real cloud that we created manually. This uniques
    identifier differs based on resource.
    */

    ami = "ami-07caf09b362be10b8"
    instance_type = "t2.small"
    key_name = "instanceBy_terraform"
    availability_zone = "us-east-1d"
    tags = {
      Name="ec2__vm"
    }
}