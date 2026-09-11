resource "aws_s3_bucket" "name"{
  bucket = "nik-0109"

  tags = {
    Name        = "terraform-demo"
    Environment = "Training"
  }
}
