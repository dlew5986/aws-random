variable "namespace" {
  description = "string to use for unique naming"
  type        = string
}

variable "tf_state_role_arn" {
  description = "terraform state role arn"
  type        = string
}

variable "tf_provisioner_role_arn" {
  description = "terraform provisioner role arn"
  type        = string
}

variable "user_names" {
  description = "list of user names"
  type        = list(string)
}
