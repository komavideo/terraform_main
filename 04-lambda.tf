module "lambda" {
  depends_on = [module.s3-bucket]
  source     = "terraform-aws-modules/lambda/aws"
  version    = "7.7.0"

  function_name           = local.lambda_name
  description             = "My Lambda function"
  runtime                 = "python3.12"
  handler                 = "index.main"
  source_path             = "${path.module}/lambdas/my_lambda"
  ignore_source_code_hash = false
  create_package          = true
  timeout                 = 300
  memory_size             = 128
  ephemeral_storage_size  = 512
  publish                 = false
  attach_policies         = true
  policies                = local.lambda_policies
  number_of_policies      = length(local.lambda_policies)

  store_on_s3   = local.lambda_store_on_s3
  s3_bucket     = local.lambda_s3_bucket
  s3_prefix     = local.lambda_builds_dir
  artifacts_dir = local.lambda_artifacts_dir
  package_type  = "Zip"

  environment_variables = {
    key1 = "value1"
    key2 = "value2"
  }
  tags = {
    "Environment" = "production"
  }

}
