
resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucketonno"
  acl = "private"

/*
// Block all public access
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
*/

// Bucket Versioning making disable
  versioning {
    enabled = false
  }

// Encryption key type is Amazon S3 managed keys and making bucket key Enabled
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
      bucket_key_enabled = true
    }
  }

/*
// Encryption key type is KMS and making bucket key Enabled
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "aws:kms"
        kms_master_key_id = "your-kms-key-id"
      }
      bucket_key_enabled = true
    }
  }
  */

// making Object Lock Disable
  object_lock_configuration {
    object_lock_enabled = "Enabled"
  }

  tags = {
    Name        = "My-bucket"
  }
}
