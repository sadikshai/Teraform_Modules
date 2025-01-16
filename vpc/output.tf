output "public_subnet_count" {
    value = local.public_subnet_count
  
}

output "private_subnet_count" {
    value = local.private_subnet_count
  
}


output "vpc_id" {
    value = aws_vpc.base.id
  
}

output "public_subnet_id" {
    value = aws_subnet.public[*].id
  
}

output "private_subnet_id" {
    value = aws_subnet.private[*].id
  
}