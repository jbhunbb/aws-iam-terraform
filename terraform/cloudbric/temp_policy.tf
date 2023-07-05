resource "aws_iam_user_policy" "only_user-b" {
  user = aws_iam_user.user-b.name
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowUseOfAWSWAF",
            "Effect": "Allow",
            "Action": [
                "waf:*",
                "waf-regional:*",
                "wafv2:*",
                "elasticloadbalancing:SetWebACL",
                "apigateway:SetWebACL",
                "appsync:SetWebACL",
                "logs:DescribeResourcePolicies",
                "logs:DescribeLogGroups",
                "cognito-idp:AssociateWebACL",
                "cognito-idp:DisassociateWebACL",
                "cognito-idp:ListResourcesForWebACL",
                "cognito-idp:GetWebACLForResource",
                "apprunner:AssociateWebAcl",
                "apprunner:DisassociateWebAcl",
                "apprunner:DescribeWebAclForService",
                "apprunner:ListServices",
                "apprunner:ListAssociatedServicesForWebAcl",
                "ec2:AssociateVerifiedAccessInstanceWebAcl",
                "ec2:DisassociateVerifiedAccessInstanceWebAcl",
                "ec2:DescribeVerifiedAccessInstanceWebAclAssociations",
                "ec2:GetVerifiedAccessInstanceWebAcl"
            ],
            "Resource": "*"
        },
        {
            "Sid": "AllowLogDeliverySubscription",
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogDelivery",
                "logs:DeleteLogDelivery"
            ],
            "Resource": "*"
        },
        {
            "Sid": "GrantLogDeliveryPermissionForS3Bucket",
            "Effect": "Allow",
            "Action": [
                "s3:PutBucketPolicy",
                "s3:GetBucketPolicy"
            ],
            "Resource": [
                "arn:aws:s3:::aws-waf-logs-*"
            ]
        },
        {
            "Sid": "GrantLogDeliveryPermissionForCloudWatchLogGroup",
            "Effect": "Allow",
            "Action": [
                "logs:PutResourcePolicy"
            ],
            "Resource": "*",
            "Condition": {
                "ForAnyValue:StringEquals": {
                    "aws:CalledVia": [
                        "wafv2.amazonaws.com"
                    ]
                }
            }
        }
    ]
}
EOF
}