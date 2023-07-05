# IAM User Group 선언
resource "aws_iam_group" "agroup" {
  name = "cloudbric-terrform-test"
}

# IAM Policy 선언
resource "aws_iam_policy" "Aservice-test" {
  name        = "terraform-service-Group"
  description = "Aservice test policy"
  policy      = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "ec2:Describe*",
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "elasticloadbalancing:Describe*",
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "cloudwatch:ListMetrics",
                "cloudwatch:GetMetricStatistics",
                "cloudwatch:Describe*"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "autoscaling:Describe*",
            "Resource": "*"
        }
    ]
}
EOF
}

# IAM User 선언
resource "aws_iam_user" "user-b" {
  name = "terraform-bhji"
}

# Aservice-test IAM Policy 를 선언한 IAM User Group에 연결
resource "aws_iam_group_policy_attachment" "test-attach" {
  group      = aws_iam_group.agroup.name
  policy_arn = aws_iam_policy.Aservice-test.arn
}

# user-b IAM User를 agroup에 할당
resource "aws_iam_user_group_membership" "agroup_attach" {
  user = aws_iam_user.user-b.name
  groups = [
    aws_iam_group.agroup.name,
  ]
}