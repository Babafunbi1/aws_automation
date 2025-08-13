
resource "aws_s3_bucket" "test_bucket" {
  bucket = "funbi-tf-test-bucket"

  tags = {
    Name        = "Terraform bucket"
    Environment = "Testing"
  }
}

resource "aws_s3_bucket_website_configuration" "static_site" {
  bucket = aws_s3_bucket.test_bucket.id

  index_document {
    suffix = "index.html"
  }

}

resource "aws_s3_bucket_policy" "public_read" {
  bucket = aws_s3_bucket.test_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.test_bucket.arn}/*"
      }
    ]
  })
}

resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.test_bucket.id
  key          = "index.html"
  source       = "/babafunbiolowoyo/desktop/index.html"
  content_type = "text/html"
}



