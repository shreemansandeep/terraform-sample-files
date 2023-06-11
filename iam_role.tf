// The "aws_iam_role" resource block creates an IAM role named "s3-full-access-role" and specifies the trust policy allowing EC2 instances to assume this role.
resource "aws_iam_role" "s3_role" {
  name = "s3-full-access-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

// The "aws_iam_policy" resource block creates an IAM policy named "s3-full-access-policy" that allows full access
resource "aws_iam_policy" "s3_policy" {
  name        = "s3-full-access-policy"
  description = "Allows full access to S3 buckets"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "S3FullAccess",
      "Effect": "Allow",
      "Action": "s3:*",
      "Resource": "*"
    }
  ]
}
EOF
}

// The "aws_iam_policy_attachment" resource block attaches the IAM policy created in the previous step to the IAM role.
resource "aws_iam_policy_attachment" "s3_policy_attachment" {
  name       = "s3-full-access-attachment"
  roles      = [aws_iam_role.s3_role.name]
  policy_arn = aws_iam_policy.s3_policy.arn
}
