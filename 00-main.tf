###########################################################
# Terraform 基本设置
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.56.0"
    }
  }

  # backend "s3" {
  #   # profile = "default"

  #   # bucket = "terraform-state"
  #   # key    = "terraform.tfstate"
  #   # region = "ap-northeast-1"

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
