provider "aws" {
  region  = var.aws_region
  version = "~> 3.0"
}


resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr_block
  tags       = var.vpc_tags
}

resource "aws_subnet" "public_east-a" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.a-public-subnet_cidr
  availability_zone       = var.a-public-subnet_zone
  map_public_ip_on_launch = true

  tags = var.subnets_tags
}
resource "aws_subnet" "public_east-b" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.b-public-subnet_cidr
  availability_zone       = var.b-public-subnet_zone
  map_public_ip_on_launch = true

  tags = var.subnets_tags
}
