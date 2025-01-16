resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.base.id
    tags = {
        Name="${var.vpc_name}-igw"
    }
  
}


resource "aws_eip" "nat_eip" {
domain = "vpc"
}

resource "aws_nat_gateway" "db_natgate" {
  allocation_id=aws_eip.nat_eip.id
  subnet_id = aws_subnet.public[1].id
  tags = {
    Name="${var.vpc_name}-natgate"
  }
  
  
}

resource "aws_route_table" "public" {
    vpc_id = aws_vpc.base.id
    tags = {
      Name="public_route_table"
    }
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
  
}

resource "aws_route_table_association" "public_route" {
    count = local.public_subnet_count
    subnet_id = aws_subnet.public[count.index].id
    route_table_id = aws_route_table.public.id
  
}



resource "aws_route_table" "private" {
    vpc_id = aws_vpc.base.id
    tags = {
      Name="private_route_table"
    }
    route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.db_natgate.id
  }
    
  
}

resource "aws_route_table_association" "private_route" {
    count = local.private_subnet_count
    subnet_id = aws_subnet.private[count.index].id
    route_table_id = aws_route_table.private.id
  
}