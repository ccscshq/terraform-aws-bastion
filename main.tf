resource "aws_instance" "this" {
  ami                         = coalesce(var.ec2_ami, data.aws_ssm_parameter.ami_id_al2023_arm64.value)
  instance_type               = var.ec2_instance_type
  iam_instance_profile        = aws_iam_instance_profile.this.name
  subnet_id                   = var.ec2_subnet_id
  vpc_security_group_ids      = [aws_security_group.this.id]
  user_data_base64            = coalesce(var.ec2_user_data_base64, filebase64("${path.module}/user_data.sh"))
  user_data_replace_on_change = true

  tags = {
    Name       = "${var.prefix} bastion"
    SSMEnabled = "true"
  }
}

resource "aws_eip" "this" {
  instance = aws_instance.this.id
  domain   = "vpc"
}
