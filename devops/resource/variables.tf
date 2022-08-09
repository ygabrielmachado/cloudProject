variable "aws_region" {
  type    = string
  default = "us-east-2"
}
variable "vpc_tags" {
  type        = map(string)
  description = ""
}

variable "vpc_cidr_block" { type = string }

variable "a-public-subnet_cidr" { type = string }
variable "b-public-subnet_cidr" { type = string }

variable "a-public-subnet_zone" { type = string }
variable "b-public-subnet_zone" { type = string }
variable "subnets_tags" {
  type        = map(string)
  description = ""
}

variable "ec2-instance_type" { type = string }
variable "pair-key_name" { type = string }
variable "instance_tags" {
  type        = map(string)
  description = ""
}

variable "gateway_tags" {
  type        = map(string)
  description = ""
}
