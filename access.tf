resource "aws_iam_user" "test_user" {
  name = "Babshova"
}

resource "aws_iam_user_policy_attachment" "s3_readonly" {
  user       = aws_iam_user.test_user.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

resource "aws_iam_user_policy_attachment" "ec2_full_access" {
  user       = aws_iam_user.test_user.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}
 
resource "aws_iam_user_login_profile" "console_access" {
  user                    = aws_iam_user.test_user.name
  password_length         = 10
  password_reset_required = true
}