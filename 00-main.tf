###########################################################
# Terraform 基本设置
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.56.0"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }

  # backend "s3" {
  #   # profile = "default"

  #   # bucket = "terraform-state"
  #   # key    = "terraform.tfstate"
  #   # region = "ap-northeast-1"
  #   # region = "us-east-1"

  #   # Status Lock
  #   # dynamodb_table = "terraform-lock-table"
  # }

  required_version = ">= 1.9.0"
}

###########################################################
# 提供商设置(云平台)
provider "aws" {
  profile = "default"
  region  = var.aws_region
}

###########################################################
# Docker
provider "docker" {
  registry_auth {
    address  = format("%v.dkr.ecr.%v.amazonaws.com", data.aws_caller_identity.this.account_id, data.aws_region.current.name)
    username = data.aws_ecr_authorization_token.token.user_name
    password = data.aws_ecr_authorization_token.token.password
  }
}
