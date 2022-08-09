resource "aws_security_group" "ec2_group_ce" {
  name   = "allow-all-sg"
  vpc_id = aws_vpc.main_vpc.id
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description     = "Port 80"
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    security_groups = [aws_security_group.alb.id]

  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
resource "aws_security_group" "alb" {
  name        = "terraform_alb_security_group"
  description = "Terraform load balancer security group"
  vpc_id      = aws_vpc.main_vpc.id
  tags = {
    Name = "alb-security_group"
  }
  ingress {
    description = "Port 80"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
