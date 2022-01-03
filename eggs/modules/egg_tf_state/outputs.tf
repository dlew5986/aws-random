output "config" {
  value = {
    bucket         = aws_s3_bucket.bucket.bucket
    dynamodb_table = aws_dynamodb_table.table.name
    role_arn       = aws_iam_role.tf_state.arn
  }
}
