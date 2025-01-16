# VPC Terraform Module

This module creates an AWS Virtual Private Cloud (VPC) with public and private subnets, Internet Gateway, NAT Gateway, route tables, and route table associations.

## Features

- Creates a VPC with the specified CIDR block.
- Configures public and private subnets across availability zones.
- Sets up an Internet Gateway (IGW) for public subnets.
- Deploys a NAT Gateway (NAT) for private subnets.
- Creates route tables for public and private subnets.
- Associates route tables with respective subnets.

## Inputs

The following inputs must be provided by the user:

| Name                      | Type           | Description                                                             | Example Values                      |
|---------------------------|----------------|-------------------------------------------------------------------------|-------------------------------------|
| `vpc_cidr_block`          | `string`       | The CIDR block for the VPC.                                            | `10.0.0.0/16`                       |
| `vpc_name`                | `string`       | Name of the VPC.                                                       | `my-vpc`                            |
| `public_cidr_block`       | `list(string)` | List of CIDR blocks for the public subnets.                            | `["10.0.1.0/24", "10.0.2.0/24"]` |
| `public_availability_zone`| `list(string)` | List of availability zones for the public subnets.                     | `["us-west-1a", "us-west-1b"]`    |
| `private_cidr_block`      | `list(string)` | List of CIDR blocks for the private subnets.                           | `["10.0.3.0/24", "10.0.4.0/24"]` |
| `private_availability_zone`| `list(string)` | List of availability zones for the private subnets.                    | `["us-west-1a", "us-west-1b"]`    |

## Outputs

This module does not explicitly define outputs in the provided code. If needed, you can add outputs such as the VPC ID, subnet IDs, or NAT Gateway ID in your module.

## Usage

```hcl
module "vpc" {
  source                   = "./path-to-your-module"
  vpc_cidr_block            = "10.0.0.0/16"
  vpc_name                  = "modvpc"
  public_cidr_block         = ["10.0.0.0/24", "10.0.1.0/24"]
  public_availability_zone  = ["ap-south-1a", "ap-south-1b"]
  private_availability_zone = ["ap-south-1a", "ap-south-1b"]
  private_cidr_block        = ["10.0.2.0/24", "10.0.3.0/24"]



}
```

## Resources Created

This module creates the following AWS resources:

1. **VPC**
   - `aws_vpc`
2. **Subnets**
   - `aws_subnet.public`
   - `aws_subnet.private`
3. **Internet Gateway (IGW)**
   - `aws_internet_gateway`
4. **Elastic IP (EIP)**
   - `aws_eip`
5. **NAT Gateway (NAT)**
   - `aws_nat_gateway`
6. **Route Tables**
   - `aws_route_table.public`
   - `aws_route_table.private`
7. **Route Table Associations**
   - `aws_route_table_association.public_route`
   - `aws_route_table_association.private_route`

## Notes

- Ensure that the provided CIDR blocks do not overlap.
- Specify appropriate availability zones based on the AWS region where the resources will be deployed.

## Prerequisites

- Terraform installed.
- AWS CLI configured with appropriate credentials.

