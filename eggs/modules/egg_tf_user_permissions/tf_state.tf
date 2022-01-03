data "aws_iam_policy_document" "tf_state" {
  statement {
    sid = "assumeRole"
    actions = [
      "sts:AssumeRole"
    ]
    resources = [var.tf_state_role_arn]
  }
}

resource "aws_iam_user_policy" "tf_state" {
  for_each = toset(var.user_names)
  user     = each.value
  name     = "${var.namespace}-assume-role-tf-state-readwrite"
  policy   = data.aws_iam_policy_document.tf_state.json
}
