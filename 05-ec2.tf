# https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/blob/master/examples/complete/main.tf
module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.5.0"

  ami                         = data.aws_ami.amazonlinux_2023.id
  name                        = local.ec2_name
  instance_type               = local.ec2_instance_type
  key_name                    = local.ec2_key_name
  monitoring                  = false
  vpc_security_group_ids      = [module.security-group.security_group_id]
  subnet_id                   = element(module.vpc.public_subnets, 0)
  associate_public_ip_address = true

  create_iam_instance_profile = true
  iam_role_description        = "IAM role for EC2 instance"
  iam_role_policies = {
    AdministratorAccess = "arn:aws:iam::aws:policy/AdministratorAccess"
  }

  root_block_device = [
    {
      encrypted   = true
      volume_type = "gp3"
      throughput  = 125
      volume_size = 10
    },
  ]

  tags = local.common_tags
}
