resource "aws_vpc" "test_vpc" {
  cidr_block       = "10.1.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Terraform"
    Environment = "Testing"
  }
}

resource "aws_subnet" "test_subnet_az1" {
  vpc_id     = aws_vpc.test_vpc.id
  cidr_block = "10.1.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Terraform"
    Environment = "Testing"
  }
}

resource "aws_subnet" "test_subnet_az2" {
  vpc_id     = aws_vpc.test_vpc.id
  cidr_block = "10.1.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "Terraform"
    Environment = "Testing"
  }
}