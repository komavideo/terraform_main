module "docker_build_from_ecr" {
  depends_on = [module.ecr]
  source     = "./modules/docker-build"

  source_path = "${path.module}/lambdas/my_lambda"
  ecr_repo    = module.ecr.repository_name

  create_ecr_repo      = false
  ecr_force_delete     = false
  use_image_tag        = true
  image_tag            = formatdate("YYYYMMDDhhmmss", timestamp()) #"0.1.0"
  image_tag_mutability = "IMMUTABLE"
  scan_on_push         = true
  keep_remotely        = true
  # platform             = "linux/amd64"
}


module "lambda" {
  depends_on = [module.docker_build_from_ecr]
  source     = "terraform-aws-modules/lambda/aws"
  version    = "7.7.0"

  function_name           = local.lambda_name
  description             = "My Lambda function"
  architectures           = local.lambda_architectures
  timeout                 = 300
  memory_size             = 128
  ephemeral_storage_size  = 512
  publish                 = false
  create_package          = false
  image_uri               = module.docker_build_from_ecr.image_uri
  package_type            = "Image"
  ignore_source_code_hash = false
  attach_policies         = true
  policies                = local.lambda_policies
  number_of_policies      = length(local.lambda_policies)
  environment_variables = {
    key1 = "value1"
    key2 = "value2"
    key3 = "value3"
  }
  tags = {
    "Environment" = "production"
  }

}
