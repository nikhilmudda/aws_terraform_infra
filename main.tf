resoruce "aws_s3_bucket" "website" {
  bucket = var.bucket_name

tags = {
  Name = "terraform_static_website_Nik"
  Environment = "training"
}
