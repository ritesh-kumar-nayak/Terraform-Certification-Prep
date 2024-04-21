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
    source      = "apps_doc/test-file.html"
    destination = "/tmp/test-file.html"

  }
  # File provisioner: Copied the given content to the destnation file.
  provisioner "file" {
    content     = "ami used: ${self.ami}"
    destination = "/tmp/file.log"
  }

  # File provisioner: Copied directory to remote machine
  provisioner "file" {
    source      = "apps_doc/app1"
    destination = "/tmp"

  }

  provisioner "file" {
    source      = "apps_doc/app2/" # when we are putting / at the end of app2, it will copy all the files, folders and content that are present inside app2 but not app2 folder as whole.
    destination = "/tmp"
    on_failure = continue # this will allow terraform to avoid the failure and proceed with resource creation
    #when = destroy 
    when = create

  }

  tags = {
    Name = "${terraform.workspace}-instance-${count.index}" # tag will also be named as per the workspace we'll be working in.

  }

}
/* If we define the "when" attribute inside provisioner block then, it will decide the provisioner execution time.
By default the provisioner executes at resource creation time*/

/* "on_failure=continue" flag will allow Terraform to proceed with resource creation ignoring any provision error/failure that 
occurs. The default behaviour of terraform on provisioner execution failure is that the terraform apply will fail and 
whatever resources that are created before failure will be marked as "tainted" and will be replaced(recreated in the next terraform apply*/