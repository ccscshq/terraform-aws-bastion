module "network" {
  source = "git@github.com:ccscshq/terraform-aws-network.git?ref=v0.2.0"

  prefix                 = local.prefix
  ipv4_cidr              = local.ipv4_cidr
  ipv4_cidr_newbits      = local.ipv4_cidr_newbits
  subnets_number         = local.subnets_number
  create_private_subnets = true
}

module "bastion_arm64" {
  source = "../.."

  prefix        = "${local.prefix}-arm64"
  ec2_subnet_id = module.network.private_subnet_ids[0]
  ec2_vpc_id    = module.network.vpc_id
}

module "bastion_x86_64" {
  source = "../.."

  prefix               = "${local.prefix}-x86-64"
  ec2_instance_type    = "t3.micro"
  ec2_subnet_id        = module.network.private_subnet_ids[0]
  ec2_vpc_id           = module.network.vpc_id
  ec2_ami              = data.aws_ssm_parameter.ami_id_al2023_x86_64.value
  ec2_user_data_base64 = filebase64("${path.module}/user_data.sh")
}

data "aws_ssm_parameter" "ami_id_al2023_x86_64" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-6.1-x86_64"
}
