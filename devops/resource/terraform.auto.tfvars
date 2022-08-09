aws_region = "us-east-2"

vpc_tags = {
  Name    = "VPC_Pro-v0_1"
  Project = "CE_Pro-v0_1"

}
vpc_cidr_block = "192.176.0.0/16"

a-public-subnet_cidr = "192.176.10.0/24"
b-public-subnet_cidr = "192.176.11.0/24"

a-public-subnet_zone = "us-east-2a"
b-public-subnet_zone = "us-east-2b"


subnets_tags = {
  Name    = "Subnets_PRO"
  Project = "CE_Pro-v0_1"
  Tier    = "Public"
}

ec2-instance_type = "t2.micro"
pair-key_name     = "private_key_pem"
instance_tags = {
  Name    = "backend_app_ec2"
  Project = "CE_Pro-v0_1"
}

gateway_tags = {
  Name    = "IGW-CE_Pro-v0_1"
  Project = "CE_Pro-v0_1"
}


