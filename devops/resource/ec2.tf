data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Ubuntu
}

resource "aws_instance" "ec2_backend-1" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = var.ec2-instance_type
  subnet_id       = "${aws_subnet.public_east-a.id}"
  key_name        = aws_key_pair.aws_key.key_name
  security_groups = ["${aws_security_group.ec2_group_ce.id}"]

  tags = var.instance_tags
}

resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "aws_key" {
  key_name   = "bitops-ssh-key"
  public_key = tls_private_key.key.public_key_openssh
}

resource "aws_instance" "ec2_backend-2" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = var.ec2-instance_type
  subnet_id       = "${aws_subnet.public_east-b.id}"
  key_name        = aws_key_pair.aws_key.key_name
  security_groups = ["${aws_security_group.ec2_group_ce.id}"]

  tags = var.instance_tags
}
