# IAM policy
resource "aws_iam_policy" "ec2_iam_policy" {
    name        = "ec2_iam_policy"
    path        = "/"
    description = "IAM policy to provide permission to EC2 instance"

    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                "Effect": "Allow",
                "Action": [
                    "ssm:GetParameters",
                    "ssm:GetParameter"
                ],
                "Resource": "*"
            },
            {
                "Effect": "Allow",
                "Action": [
                    "s3:GetObject",
                    "s3:List*"
                ],
                "Resource": "*"
            }
        ]
    })
}
