# Security Group Terraform Module

This module creates AWS security groups with configurable ingress and egress rules for web and database components. It also provides outputs for the security group IDs.

## Features

- Creates a security group for web applications.
- Creates a security group for database applications.
- Configurable ingress and egress rules for each security group.

## Inputs

The following inputs must be provided by the user:

| Name                            | Type            | Description                                                                 | Example Values                      |
|---------------------------------|-----------------|-----------------------------------------------------------------------------|-------------------------------------|
| `web_security_name`             | `string`        | Name of the web security group.                                            | `web-sg`                            |
| `web_security_group_description`| `string`        | Description of the web security group.                                     | `Web security group`                |
| `web_security_group_tag_name`   | `string`        | Tag name for the web security group.                                       | `web-sg-tag`                        |
| `web_security_group_rules`      | `list(object)`  | Ingress rules for the web security group.                                  | See example below                   |
| `db_security_name`              | `string`        | Name of the database security group.                                       | `db-sg`                             |
| `db_security_group_description` | `string`        | Description of the database security group.                                | `Database security group`           |
| `db_security_group_tag_name`    | `string`        | Tag name for the database security group.                                  | `db-sg-tag`                         |
| `db_security_group_rules`       | `list(object)`  | Ingress rules for the database security group.                             | See example below                   |
| `vpc_id`                        | `string`        | The ID of the VPC where the security groups will be created.               | `vpc-12345678`                      |

### Example: `web_security_group_rules` and `db_security_group_rules`

The `web_security_group_rules` and `db_security_group_rules` are lists of objects defining ingress rules. Each rule must include the following fields:

| Field       | Type    | Description                                                                 | Default Value (Optional) |
|-------------|---------|-----------------------------------------------------------------------------|--------------------------|
| `cidr_ipv4` | `string`| The CIDR block for the ingress rule.                                        | `"0.0.0.0/0"`           |
| `from_port` | `number`| The starting port for the ingress rule.                                    | N/A                      |
| `to_port`   | `string`| The ending port for the ingress rule.                                      | N/A                      |
| `ip_protocol`| `string`| The protocol for the ingress rule.                                         | `"tcp"`                 |

Example:
```hcl
web_security_group_rules = [
  {
    cidr_ipv4   = "0.0.0.0/0"
    from_port   = 80
    to_port     = 80
    ip_protocol = "tcp"
  },
  {
    cidr_ipv4   = "0.0.0.0/0"
    from_port   = 443
    to_port     = 443
    ip_protocol = "tcp"
  }
]
```

## Outputs

The following outputs are available:

| Name                | Description                               |
|---------------------|-------------------------------------------|
| `web_security_id`   | The ID of the web security group.         |
| `db_security_id`    | The ID of the database security group.    |

## Usage

```hcl
module "security_groups" {
  source                         = "path/to/your/module"
  vpc_id                         = module.vpc.vpc_id
  web_security_name              = "websg"
  web_security_group_description = "this is for public subnet"
  web_security_group_tag_name    = "web-sg"
  public_subnet_count            = module.vpc.public_subnet_count
  private_subnet_count           = module.vpc.private_subnet_count

  web_security_group_rules = [
    {
      cidr_block  = "0.0.0.0/0"
      from_port   = 22
      to_port     = 22
      ip_protocol = "tcp"
    },
    {
      cidr_block  = "0.0.0.0/0"
      from_port   = 80
      to_port     = 80
      ip_protocol = "tcp"
    }
  ]

  db_security_name              = "dbsg"
  db_security_group_description = "this is for private subnet"
  db_security_group_tag_name    = "db-sg"

  db_security_group_rules = [
    {
      cidr_block  = "10.0.0.0/16"
      from_port   = 3306
      to_port     = 3306
      ip_protocol = "tcp"
    }
  ]
}
```

## Resources Created

This module creates the following AWS resources:

1. **Web Security Group**
   - `aws_security_group.web`
   - `aws_vpc_security_group_ingress_rule.web`
   - `aws_vpc_security_group_egress_rule.web`
2. **Database Security Group**
   - `aws_security_group.db`
   - `aws_vpc_security_group_ingress_rule.db`
   - `aws_vpc_security_group_egress_rule.db`

## Prerequisites

- Terraform installed.
- AWS CLI configured with appropriate credentials.

