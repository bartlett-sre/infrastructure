data "aws_iam_policy_document" "github" {
  statement {
    sid     = "iam"
    actions = ["iam:*"]
    resources = [
      "arn:aws:iam::*:user/${local.stack_name}-*",
      "arn:aws:iam::*:policy/${local.stack_name}-*",
    ]
  }
  statement {
    sid = "S3BackendBucket"
    actions = [
      "s3:ListBucket",
    ]
    resources = [
      "arn:aws:s3:::bartlett-remote-states"
    ]
  }
  statement {
    sid = "S3BackendBucketObjects"
    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject",
    ]
    resources = [
      "arn:aws:s3:::bartlett-remote-states/infrastructure/github/terraform.tfstate"
    ]
  }
  statement {
    sid = "S3BackendKMS"
    actions = [
      "dynamodb:PutItem",
      "dynamodb:GetItem",
      "dynamodb:DeleteItem",
    ]
    resources = [
      "arn:aws:dynamodb:eu-west-1:150539654980:table/terraform-state-lock"
    ]
  }
}


data "aws_iam_policy_document" "remote_state" {
  statement {
    sid = "test"
    actions = [
      "s3:ListAllMyBuckets"
    ]
    resources = [
      "*"
    ]
  }
}
