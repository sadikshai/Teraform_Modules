resource "aws_vpc" "base" {
    cidr_block = var.vpc_cidr_block
    tags = {
      Name=var.vpc_name
    }
  
}


resource "aws_subnet" "public" {
  count=local.public_subnet_count
  vpc_id = aws_vpc.base.id
  cidr_block = var.public_cidr_block[count.index]
  availability_zone = var.public_availability_zone[count.index]
  tags = {
    Name = "public_subnet_${count.index + 1}"
  }

  
}


resource "aws_subnet" "private" {
  count = local.private_subnet_count
  vpc_id = aws_vpc.base.id
  cidr_block = var.private_cidr_block[count.index]
  availability_zone = var.private_availability_zone[count.index]
  tags = {
    Name = "private_subnet_${count.index + 1}"
  }
  
}