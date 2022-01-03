terraform {
  backend "s3" {
    bucket         = "koffee-tf-state"
    dynamodb_table = "koffee-tf-state-locks"
    encrypt        = true
    key            = "blue/terraform.tfstate"
    region         = "us-east-2"
    role_arn       = "arn:aws:iam::909778441571:role/koffee-tf-state-readwrite"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"

  assume_role {
    role_arn = "arn:aws:iam::909778441571:role/koffee-tf-provisioner"
  }

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
