terraform {
  #required_version = ">= 0.13, < 0.14"
  backend "s3" {
    bucket = "terraform-state-red"
    key    = "global/s3/terraform.tfstate"
    region = "us-east-2"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-2"
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "default vpc"
  }
}

resource "aws_vpc" "red_10_1" {
  cidr_block           = "10.1.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "red_10_1"
  }
}