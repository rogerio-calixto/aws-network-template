variable "aws_access_key" {
  type = any
  default = null
}
variable "aws_access_secret_key" {
  type = any
  default = null
}

variable "aws_profile" {
  type = any
  default = null
}

variable "aws_region" {}
variable "project" {}
variable "environment" {}
variable "cidr_block" {}
variable "subnet_pvt_config" {}
variable "subnet_pub_config" {}
