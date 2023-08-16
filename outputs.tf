output "aws_vpc_id" {
  value = aws_vpc.vpc.id
}

output "public-subnet_ids" {
  value = aws_subnet.public-subnets[*].id
}


output "private-subnet_ids" {
  value = aws_subnet.private-subnets[*].id
}

output "avaiable_zones" {
  value = data.aws_availability_zones.available.names
}
