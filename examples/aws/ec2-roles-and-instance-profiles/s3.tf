resource "aws_s3_bucket" "main-bucket" {
    bucket = "main-bucket"

    tags = {
        Name = "main-bucket"
    }
}

resource "aws_s3_bucket_acl" "main-bucket-acl" {
    bucket = aws_s3_bucket.main-bucket.id
    acl    = var.BUCKET_ACL
}
