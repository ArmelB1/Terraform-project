provider "aws" {
  region = "us-east-1"
}
resource "aws_vpc" "my_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "my_vpc"
  }
}

resource "aws_subnet" "my_pub" {
  vpc_id = aws_vpc.my_vpc.id  
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true 
  tags = {
    Name = "my_subnet"
  }
}

resource "aws_subnet" "my_prv" {
  vpc_id = aws_vpc.my_vpc.id  
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true 
  tags = {
    Name = "my_prv1"
  }
}