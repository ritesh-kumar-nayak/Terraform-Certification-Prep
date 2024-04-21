resource "aws_instance" "ec2-from-datasource" {

  ami           = data.aws_ami.amazon_linux_ami.id # This is fetched from AMI data-source
  instance_type = var.instance_type
  key_name      = "instanceBy_terraform"
  # For non-default workspace, it may be useful to spin up smaller instances
  count                  = terraform.workspace == "default" ? 2 : 1 /* It will create 2 instance if we are in Default workspace else for any other workspace it will create 1 instance*/
  user_data              = file("apache-install.sh")
  vpc_security_group_ids = [aws_security_group.ssh-SG.id, aws_security_group.web-SG.id]

}

# Once instance is created, wait for 90 second until vm is ready
resource "time_sleep" "wait_90_second" {
  depends_on      = [aws_instance.ec2-from-datasource]
  create_duration = "90s"

}

# Copying app1 content using provisioners but in a different way from inside "null_resource".
# The reason of using provisioners inside a null resource is to avoid impacting the real resource. This null resource will function out side of real ec2 resource block.



# Create Null resource
resource "null_resource" "copy_app1_content_provisioner1" {
  depends_on = [aws_instance.ec2-from-datasource] # First Instance will be created then only this.

  #For loop to dynamically get the host IPs of instances for connection block
  for_each = { for idx, instance in aws_instance.ec2-from-datasource : idx => instance }

  # Using the public IP address of each instance

  triggers = {
    always-update = timestamp()
  }
  # Connection block inside the null resource
  connection {
    type = "ssh"
    host = each.value.public_ip # ip is being refered by each.value from the above for loop that dynamically fetches the host IPs as MAP. "each.value" can only be used when refering from Maps

    user        = "ec2-user"
    password    = ""
    private_key = file("private_key/instanceBy_terraform.pem")
  }
  # Provisioner1-Copy
  provisioner "file" {
    source      = "app1/index.html"
    destination = "/tmp/index.html"

  }
  # Provisioner2-Remote-Copy
  provisioner "remote-exec" {
    inline = [
      "sudo cp /tmp/index.html /var/www/html/index.html"
    ]

  }


}