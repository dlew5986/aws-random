data "aws_iam_policy_document" "role_permissions" {

  statement {
    sid = "terraformProvisioner"
    actions = [
      "ec2:*",
      "iam:*",
      "s3:*"
    ]
    resources = ["*"]
  }

}

resource "aws_iam_policy" "role_permissions" {
  name   = "${var.namespace}-tf-provisioner"
  path   = "/"
  policy = data.aws_iam_policy_document.role_permissions.json
}
