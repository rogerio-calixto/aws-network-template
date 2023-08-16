data "aws_availability_zones" "available" {}

# subnets privadas

resource "aws_subnet" "private-subnets" {
  count             = length(var.subnet_pvt_config)
  availability_zone = var.subnet_pvt_config[count.index].available_zone
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet_pvt_config[count.index].cidr_block

  tags = {
    Name        = "${var.project}-pvt-subnet-${count.index + 1}-${var.environment}"
    Project     = var.project
    Environment = var.environment
  }

  depends_on = [aws_vpc.vpc]
}

# subnets publicas
resource "aws_subnet" "public-subnets" {
  count                   = length(var.subnet_pub_config)
  availability_zone       = var.subnet_pub_config[count.index].available_zone
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet_pub_config[count.index].cidr_block
  map_public_ip_on_launch = true
  tags = {
    Name        = "${var.project}-pub-subnet-${count.index + 1}-${var.environment}"
    Project     = var.project
    Environment = var.environment
  }

  depends_on = [aws_vpc.vpc]
}