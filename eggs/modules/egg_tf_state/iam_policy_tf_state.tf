data "aws_iam_policy_document" "role_permissions" {

  statement {
    sid = "s3bucketAccess"
    actions = [
      "s3:ListBucket"
    ]
    resources = [aws_s3_bucket.bucket.arn]
  }

  statement {
    sid = "s3bucketKeyAccess"
    actions = [
      "s3:GetObject",
      "s3:PutObject"
    ]
    resources = ["${aws_s3_bucket.bucket.arn}/*"]
  }

  statement {
    sid = "dynamodbAccess"
    actions = [
      "dynamodb:GetItem",
      "dynamodb:PutItem",
      "dynamodb:DeleteItem"
    ]
    resources = [aws_dynamodb_table.table.arn]
  }

}

resource "aws_iam_policy" "role_permissions" {
  name   = "${var.namespace}-tf-state-readwrite"
  path   = "/"
  policy = data.aws_iam_policy_document.role_permissions.json
}
