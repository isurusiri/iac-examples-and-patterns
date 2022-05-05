# IAM role
resource "aws_iam_role" "ec2_iam_role" {
    name               = "ec2_iam_role"
    assume_role_policy = jsonencode({
        Version = "2021-10-17"
        Statement = [
            {
                Action = "sts:AssumeRole"
                Effect = "Allow"
                Sid    = ""
                Principal = {
                    Service = "ec2.amazonaws.com"
                }
            },
        ]
    })
}

# IAM role-policy attachment
resource "aws_iam_policy_attachment" "ec2_policy_role" {
    name       = "ec2_attachment"
    roles      = [aws_iam_role.ec2_iam_role.name]
    policy_arn = aws_iam_policy.ec2_iam_policy.arn
}
