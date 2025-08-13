resource "aws_instance" "tf_test_instance" {
  ami = "ami-020cba7c55df1f615"
  availability_zone = "us-east-1"
  instance_type = "t2.micro"
  tags = {
    Name = "Terraform"
    Environment = "Testing"  
  }
}

resource "aws_ebs_volume" "ebs_test" {
  availability_zone = "us-east-1"
  size              = 20

  tags = {
    Name = "Terraform"
    Environment = "Testing"
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "ebs_attachment"
  volume_id   = aws_ebs_volume.ebs_test.id
  instance_id = aws_instance.tf_test_instance.id
}
