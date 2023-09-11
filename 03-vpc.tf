module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.2"

  name            = local.vpc_name
  cidr            = local.vpc_cidr
  azs             = local.vpc_azs
  public_subnets  = local.vpc_public_subnets
  private_subnets = local.vpc_private_subnets

  enable_dns_hostnames = true
  enable_dns_support   = true

  #############################################################################
  # One NAT Gateway per subnet (default behavior)
  # enable_nat_gateway     = true
  # single_nat_gateway     = false
  # one_nat_gateway_per_az = false

  # Single NAT Gateway
  enable_nat_gateway     = false
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  # One NAT Gateway per availability zone
  # enable_nat_gateway     = true
  # single_nat_gateway     = false
  # one_nat_gateway_per_az = true
  #############################################################################

  tags = local.common_tags
}
