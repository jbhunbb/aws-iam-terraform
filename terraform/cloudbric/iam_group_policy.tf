resource "aws_iam_group" "agroup" {
  name = "terraform-iam-test-group"
}

resource "aws_iam_policy" "Aservice-test" {
  name        = "terraform-bhji-test-policy"
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

resource "aws_iam_user" "user-b" {
  name = "jbhunbb-test-2"
}

resource "aws_iam_group_policy_attachment" "test-attach" {
  group      = aws_iam_group.agroup.name
  policy_arn = aws_iam_policy.Aservice-test.arn
}

resource "aws_iam_user_group_membership" "agroup_attach" {
  user = aws_iam_user.user-b.name
  groups = [
    aws_iam_group.agroup.name,
  ]
}