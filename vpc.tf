resource "aws_vpc" "test_vpc" {
  cidr_block       = "10.1.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true

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

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.test_vpc.id

  tags = {
    Name = "Terraform"
    Environment = "Testing"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.test_vpc.id

  tags = {
    Name = "Terraform"
    Environment = "Testing"
  }
}

resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public_subnet_az1" {
  subnet_id      = aws_subnet.test_subnet_az1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_subnet_az2" {
  subnet_id      = aws_subnet.test_subnet_az2.id
  route_table_id = aws_route_table.public_rt.id
}
