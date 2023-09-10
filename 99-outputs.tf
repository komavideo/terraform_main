output "APP_NAME" {
  value = var.APP_NAME
}
output "aws_region" {
  # AWS 区域
  value = var.aws_region
}

output "aws_amazonlinux2023" {
  value = data.aws_ami.amazonlinux_2023.image_id
}

output "aws_local_common_tags" {
  value = local.common_tags
}

output "aws_ec2_instance_type" {
  value = local.ec2_instance_type
}

output "aws_availability_zones" {
  value = [for r in var.aws_availability_zones : "ec2-in-${r}"]
}

output "ipinfo" {
  value = data.http.ipinfo.response_body
}

output "random_password" {
  value = nonsensitive(random_password.password.result)
}

output "random_id" {
  value = random_id.uuid.hex
}
