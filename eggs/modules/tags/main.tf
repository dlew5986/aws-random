locals {
  standard_tags = {
    project       = var.project
    created_using = var.created_using
    environment   = var.environment
  }

  all_the_tags = merge(local.standard_tags, var.additional_tags)

}
