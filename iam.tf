# Create the IAM User
resource "aws_iam_user" "my_user" {
  name = "terraform-user"

  tags = {
    Name = "Terraform IAM User"
  }
}

# Create the S3 policy
resource "aws_iam_policy" "s3_access" {
  name        = "S3AccessPolicy"
  description = "Allow access to my existing S3 bucket"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:ListBucket"
        ]
        Resource = "arn:aws:s3:::my-existing-bucket"
      },
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject"
        ]
        Resource = "arn:aws:s3:::my-existing-bucket/*"
      }
    ]
  })
}

# Attach policy to the IAM user created above
resource "aws_iam_user_policy_attachment" "s3_access" {
  user       = aws_iam_user.my_user.name
  policy_arn = aws_iam_policy.s3_access.arn
}
