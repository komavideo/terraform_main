output "aws_region" {
  # AWS 区域
  value = var.aws_region
}

output "aws_amazonlinux2023" {
  value = data.aws_ami.amazonlinux_2023.image_id
}
