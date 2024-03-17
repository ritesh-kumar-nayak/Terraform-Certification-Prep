# Resource-1: Create VPC
resource "aws_vpc" "my_vpc_1" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "dev-VPC"
  }

}

# Resource-2: Create Subnet
resource "aws_subnet" "vpc-dev-public-subnet-1" {
  vpc_id                  = aws_vpc.my_vpc_1.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true # We are launchig the EC2 instance in public subnet, so the instance should have public ip auto assigned
  tags = {
    "VPCName" = "my_vpc_1"
    "Name"    = "Dev-VPC-Subnet"
  }

}

# Resource-3: Create Internet Gateway

resource "aws_internet_gateway" "vpc_dev_igw" {
  vpc_id = aws_vpc.my_vpc_1.id
  tags = {
    "VPCName"  = "my_vpc_1"
    "igw_name" = "vpc_dev_igw"
  }

}

# Resource-4: Create Route Table

resource "aws_route_table" "vpc_dev_RT" {
  vpc_id = aws_vpc.my_vpc_1.id

}

# Resource-5: Create Route
resource "aws_route" "vpc_dev_public_route" {
  route_table_id         = aws_route_table.vpc_dev_RT.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vpc_dev_igw.id

}

# Resource-6: Associate the Route Table with the subnet
resource "aws_route_table_association" "vpc_dev_public_RT_associate" {
  route_table_id = aws_route_table.vpc_dev_RT.id
  subnet_id      = aws_subnet.vpc-dev-public-subnet-1.id

}

# Resource-7: Create Security Group

resource "aws_security_group" "dev-SG" {
  name        = "Dev-VPC-SG"
  description = "Dev vpc sg by terraform"
  vpc_id      = aws_vpc.my_vpc_1.id

  # Inbound Rule
  ingress = [
    {
      description      = "Allow port 22"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      description      = "Allow port from 80"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]


  # Outbound Rule
  egress = [
    {
      description      = "Allow all IP and Port Outbound"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]


}

