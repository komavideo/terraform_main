module "s3-bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.1.2"

  bucket = lower(local.s3_name)
  # acl    = "private"

  force_destroy = true

  attach_public_policy     = true
  block_public_acls        = true
  block_public_policy      = true
  ignore_public_acls       = true
  restrict_public_buckets  = true
  control_object_ownership = true
  object_ownership         = "BucketOwnerEnforced"

  versioning = {
    enabled = true
  }
}

module "ecr" {
  source = "terraform-aws-modules/ecr/aws"

  repository_name         = local.ecr_name
  repository_force_delete = true
  create_lifecycle_policy = false

  # repository_lambda_read_access_arns = [module.lambda.lambda_function_arn]
}
