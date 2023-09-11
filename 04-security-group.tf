module "security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name   = local.sg_name
  vpc_id = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "https-443-tcp"]
  egress_rules        = ["all-all"]
}
