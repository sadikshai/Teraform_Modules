locals {
  public_subnet_count=length(var.public_cidr_block)
  private_subnet_count=length(var.private_cidr_block)
}