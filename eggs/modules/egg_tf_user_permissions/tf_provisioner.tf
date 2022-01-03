data "aws_iam_policy_document" "tf_provisioner" {
  statement {
    sid = "assumeRole"
    actions = [
      "sts:AssumeRole"
    ]
    resources = [var.tf_provisioner_role_arn]
  }
}

resource "aws_iam_user_policy" "tf_provisioner" {
  for_each = toset(var.user_names)
  user     = each.value
  name     = "${var.namespace}-assume-role-tf-provisioner"
  policy   = data.aws_iam_policy_document.tf_provisioner.json
}
