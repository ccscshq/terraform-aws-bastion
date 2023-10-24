variable "prefix" {
  description = "Name prefix for resources."
  type        = string
}
variable "ec2_instance_type" {
  description = "Instance type of the EC2 instance."
  type        = string
  default     = "t4g.micro"
}
variable "ec2_subnet_id" {
  description = "ID of the subnet to which the instance belongs."
  type        = string
}
variable "ec2_vpc_id" {
  description = "ID of the VPC to which the instance belongs."
  type        = string
}
variable "ec2_user_data_base64" {
  description = "Base64-encoded user_data."
  type        = string
  default     = null
}
variable "ec2_ami" {
  description = "ID of the ami."
  type        = string
  default     = null
}
