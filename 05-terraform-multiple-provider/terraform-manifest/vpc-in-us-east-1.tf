resource "aws_vpc" "vpc_us_east-1" {
    
    cidr_block = "10.0.0.0/16"

    tags = {
      "Name" = "us-east-1-vpc" 
    }
  
}