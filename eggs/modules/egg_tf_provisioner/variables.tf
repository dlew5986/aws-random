variable "namespace" {
  description = "string to use for unique naming"
  type        = string
}

variable "principal_arns" {
  description = "list of user/principal arns that will be allowed to assume the iam role"
  type        = list(string)
}
