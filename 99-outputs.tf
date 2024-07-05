# output "aws_api_gateway_deployment" {
#   value = aws_api_gateway_deployment.main
# }

# output "aws_api_gateway_resource" {
#   value = aws_api_gateway_resource.main
# }

output "aws_api_gateway_url" {
  value = "${aws_api_gateway_deployment.main.invoke_url}${aws_api_gateway_resource.main.path}"
}

output "aws_region" {
  value = var.aws_region
}
