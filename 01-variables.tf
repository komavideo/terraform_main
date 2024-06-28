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
  #############################################################################
  # VPC
  vpc_name            = "${var.APP_NAME}-vpc"
  vpc_azs             = var.aws_availability_zones
  vpc_cidr            = "10.1.0.0/16"
  vpc_public_subnets  = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
  vpc_private_subnets = ["10.1.101.0/24", "10.1.102.0/24", "10.1.103.0/24"]

  #############################################################################
  # Security Group
  sg_name = "${var.APP_NAME}-sg"

  #############################################################################
  # EC2
  ec2_name          = "${var.APP_NAME}-ec2"
  ec2_instance_type = var.env == "prod" ? "t3.large" : "t3.micro"
  ec2_key_name      = "komavideo-ssh-key"

  #############################################################################
  # S3
  s3_name = "${var.APP_NAME}-s3"

  #############################################################################
  # Lambda函数
  lambda_name          = "${var.APP_NAME}-lambda"
  lambda_store_on_s3   = true
  lambda_s3_bucket     = lower(local.s3_name)
  lambda_builds_dir    = "lambda-builds/"
  lambda_artifacts_dir = "${path.root}/.terraform/${local.lambda_builds_dir}"
  lambda_policies = [
    # "arn:aws:iam::aws:policy/AdministratorAccess",
    "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole",
  ]

  #############################################################################
  # API Gateway
  api_gateway_name = "${var.APP_NAME}-api-gateway"


  #############################################################################
  # Tag
  common_tags = {
    Owner = var.APP_NAME
    Env   = var.env
  }
}
