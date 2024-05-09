resource "aws_instance" "ec2-from-datasource" {

  ami           = data.aws_ami.amazon_linux_ami.id # This is fetched from AMI data-source
  instance_type = var.instance_type
  key_name      = "instanceBy_terraform"
  # For non-default workspace, it may be useful to spin up smaller instances
  count                  = terraform.workspace == "default" ? 2 : 1 /* It will create 2 instance if we are in Default workspace else for any other workspace it will create 1 instance*/
  user_data              = file("apache-install.sh")
  vpc_security_group_ids = [aws_security_group.ssh-SG.id, aws_security_group.web-SG.id]

  # Define Connection Block for Provisioner to connect to EC2 instance.
  # For linux the connection type is "SSH" and for Windows it's "WinRM"
  connection {
    type        = "ssh"
    host        = self.public_ip # as we are inside the resource block, we can use self attribute to refer to any obiect of the instance that will be created.
    user        = "ec2-user"
    private_key = file("private_key/instanceBy_terraform.pem")
  }

  # File provisioner : Copies the file to the remote machine's directory
  provisioner "file" {
    source      = "app1/index.html"
    destination = "/tmp/index.html"

  }

  # Remote-Exec provisioner: executes scripts, commands or configurations remotely on newly provisioned instance
  provisioner "remote-exec" {
    inline = [
      "sleep 120",
      "sudo cp /tmp/index.html /var/www/html/index.html"

    ]

  }

  tags = {
    Name = "${terraform.workspace}-instance-${count.index}" # tag will also be named as per the workspace we'll be working in.

  }

}