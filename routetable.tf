# roteamento subnets publicas
resource "aws_route_table" "rt-pub" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name        = "${var.project}-rt-pub-${var.environment}"
    Project     = var.project
    Environment = var.environment
  }

  depends_on = [aws_vpc.vpc, aws_internet_gateway.igw]
}

resource "aws_route_table_association" "rt-association-pub" {
  count          = length(var.subnet_pub_config)
  route_table_id = aws_route_table.rt-pub.id
  subnet_id      = aws_subnet.public-subnets.*.id[count.index]

  depends_on = [aws_subnet.public-subnets]
}