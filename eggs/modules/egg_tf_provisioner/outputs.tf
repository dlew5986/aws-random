output "config" {
  value = {
    role_arn = aws_iam_role.tf_provisioner.arn
  }
}
