resource "aws_vpc" "vpc-us-west-1" {
    provider = aws.us-west-1-provider
    
    cidr_block = "10.1.0.0/16"
    tags = {
      "Name" = "us-west-1-vpc"
    }
}

/*
 provider = aws.us-west-1-provider 
 provider = <providerName>.<alias> this is a meta argument from resource section, nothing but a special argument 
 
*/