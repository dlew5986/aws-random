data "aws_iam_policy_document" "role_trust_relationship" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = var.principal_arns
    }
  }
}

resource "aws_iam_role" "tf_state" {
  name                 = "${var.namespace}-tf-state-readwrite"
  path                 = "/"
  assume_role_policy   = data.aws_iam_policy_document.role_trust_relationship.json
  max_session_duration = 43200
}

resource "aws_iam_role_policy_attachment" "tf_state" {
  role       = aws_iam_role.tf_state.name
  policy_arn = aws_iam_policy.role_permissions.arn
}
