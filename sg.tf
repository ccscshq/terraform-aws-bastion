resource "aws_security_group" "this" {
  name   = "${var.prefix}-bastion-sg"
  vpc_id = var.ec2_vpc_id

  tags = {
    Name = "${var.prefix} bastion sg"
  }
}

resource "aws_security_group_rule" "egress" {
  security_group_id = aws_security_group.this.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
}
