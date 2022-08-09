resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name = "A_igw_lab1"
    Name = "IGW-Pro"
  }
}

resource "aws_route_table" "table_public_east-a" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id

  }
  tags = {
    Name = "table_public_east-a"
  }
  depends_on = [aws_internet_gateway.main]

}
resource "aws_route_table" "table_public_east-b" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id

  }
  tags = {
    Name = "table_public_east-b"
  }
  depends_on = [aws_internet_gateway.main]

}

resource "aws_route_table_association" "public_association_east-a" {
  subnet_id      = aws_subnet.public_east-a.id
  route_table_id = aws_route_table.table_public_east-a.id
}
resource "aws_route_table_association" "public_association_east-b" {
  subnet_id      = aws_subnet.public_east-b.id
  route_table_id = aws_route_table.table_public_east-b.id
}

