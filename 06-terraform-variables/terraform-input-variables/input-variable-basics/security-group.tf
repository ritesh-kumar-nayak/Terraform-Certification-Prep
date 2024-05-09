# Secirity group for SSH
resource "aws_security_group" "ssh-SG" {
  name        = "SSH Sg"
  description = "This security group will have rules for ssh connectivity"
  # Inbound Rule

  ingress = [{
    description      = "Allow port 22"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false

  }]

  egress = [{
    description      = "allow all ip and ports outbound"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
  }]
}

# Security Group for Web Traffic
resource "aws_security_group" "web-SG" {
  name        = "WEB sg"
  description = "This will enable web traffic"

  ingress = [{
    from_port        = 80
    to_port          = 80
    description      = "allow http"
    cidr_blocks      = ["0.0.0.0/0"]
    protocol         = "tcp"
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false

    },
    {
      from_port        = 443
      to_port          = 443
      description      = "allow HTTPS"
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
  }]

  egress = [{
    description      = "allow all ip and ports outbound"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
  }]

}