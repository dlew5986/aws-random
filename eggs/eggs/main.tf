terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
  default_tags {
    tags = module.tags.all_the_tags
  }
}

module "tags" {
  source = "../modules/tags"
  additional_tags = {
    github_repo    = "koffee"
    tf_root_module = "eggs"
  }
}

resource "aws_iam_user" "automation" {
  name = "koffee-automation"
}

data "aws_iam_role" "blueAdmin" {
  name = "blueAdmin"
}

module "egg_tf_state" {
  source         = "../modules/egg_tf_state"
  namespace      = "koffee"
  principal_arns = [aws_iam_user.automation.arn,data.aws_iam_role.blueAdmin.arn]
}

module "egg_tf_provisioner" {
  source         = "../modules/egg_tf_provisioner"
  namespace      = "koffee"
  principal_arns = [aws_iam_user.automation.arn,data.aws_iam_role.blueAdmin.arn]
}

module "egg_tf_user_permissions" {
  source                  = "../modules/egg_tf_user_permissions"
  namespace               = "koffee"
  tf_state_role_arn       = module.egg_tf_state.config.role_arn
  tf_provisioner_role_arn = module.egg_tf_provisioner.config.role_arn
  user_names              = [aws_iam_user.automation.name]
}
