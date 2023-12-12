variable "aws_profile" {
  type = string
  default = null
}
variable "aws_access_key" {
  type = string
}
variable "aws_access_secret_key" {
  type = string
}
variable "aws_region" {}
variable "project" {}
variable "environment" {}
variable "cidr_block" {}
variable "subnet_pvt_config" {}
variable "subnet_pub_config" {}
