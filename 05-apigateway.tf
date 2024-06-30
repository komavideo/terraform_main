# 创建API Gateway REST API
resource "aws_api_gateway_rest_api" "main" {
  depends_on  = [module.lambda]
  name        = local.api_gateway_name
  description = "main API Gateway"
}

# 创建API Gateway资源
resource "aws_api_gateway_resource" "main" {
  rest_api_id = aws_api_gateway_rest_api.main.id
  parent_id   = aws_api_gateway_rest_api.main.root_resource_id
  path_part   = "lambda"
}

# 创建API Gateway POST方法
resource "aws_api_gateway_method" "post" {
  rest_api_id   = aws_api_gateway_rest_api.main.id
  resource_id   = aws_api_gateway_resource.main.id
  http_method   = "POST"
  authorization = "NONE"
}

# 创建API Gateway集成(POST)
resource "aws_api_gateway_integration" "main_post" {
  rest_api_id             = aws_api_gateway_rest_api.main.id
  resource_id             = aws_api_gateway_resource.main.id
  http_method             = aws_api_gateway_method.post.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = module.lambda.lambda_function_invoke_arn
}

# 创建API Gateway GET方法
resource "aws_api_gateway_method" "get" {
  rest_api_id   = aws_api_gateway_rest_api.main.id
  resource_id   = aws_api_gateway_resource.main.id
  http_method   = "GET"
  authorization = "NONE"
}

# 创建API Gateway集成(GET)
resource "aws_api_gateway_integration" "main_get" {
  rest_api_id             = aws_api_gateway_rest_api.main.id
  resource_id             = aws_api_gateway_resource.main.id
  http_method             = aws_api_gateway_method.get.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = module.lambda.lambda_function_invoke_arn
}


# 创建API Gateway部署
resource "aws_api_gateway_deployment" "main" {
  depends_on  = [aws_api_gateway_integration.main_get, aws_api_gateway_integration.main_post]
  rest_api_id = aws_api_gateway_rest_api.main.id
  stage_name  = "dev"
}

# 给予Lambda权限调用API Gateway
resource "aws_lambda_permission" "apigw" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = module.lambda.lambda_function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.main.execution_arn}/*/*"
}
