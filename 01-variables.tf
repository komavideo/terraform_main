variable "APP_NAME" {
  default = "KomaDevOps"
}

# AWS Region
variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "ap-northeast-1"
}

# Env
variable "env" {
  default = "dev" # dev,stg,prod
}

variable "aws_availability_zones" {
  type    = list(string)
  default = ["ap-northeast-1a", "ap-northeast-1c", "ap-northeast-1d"]
}

locals {
  common_tags = {
    Owner = var.APP_NAME
    Env   = var.env
  }

  ec2_instance_type = var.env == "prod" ? "t3.large" : "t3.micro"
}
