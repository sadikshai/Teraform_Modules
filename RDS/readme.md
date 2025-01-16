# RDS Terraform Module

This module provisions an AWS RDS MySQL database instance along with its subnet group. It is designed to create a secure, scalable, and highly available database setup.

## Features

- Creates an RDS MySQL database instance.
- Associates the database with a specified security group.
- Configures the database to use a subnet group for private network access.
- Provides support for skipping the final snapshot during resource deletion.

## Inputs

The following inputs must be provided to use the module:

| Name                     | Type           | Description                                                                  | Example Values                     |
|--------------------------|----------------|------------------------------------------------------------------------------|------------------------------------|
| `allocated_storage`      | `number`       | The allocated storage size (in GB) for the database.                        | `10`                               |
| `db_name`                | `string`       | Name of the database to create within the instance.                         | `"my_db_mysql"`                    |
| `engine`                 | `string`       | Database engine for the RDS instance.                                       | `"mysql"`                          |
| `engine_version`         | `string`       | Version of the database engine to use.                                      | `"8.0.34"`                         |
| `instance_class`         | `string`       | The instance type for the RDS database instance.                            | `"db.t3.micro"`                    |
| `username`               | `string`       | Master username for the database instance.                                  | `"qtdevopsdb"`                     |
| `password`               | `string`       | Master password for the database instance.                                  | `"qtdevopspass"`                   |
| `vpc_security_group_ids` | `string`       | Security group ID to associate with the database instance.                  | `"sg-12345678"`                    |
| `skip_final_snapshot`    | `bool`         | Whether to skip the final snapshot during database deletion.                | `true`                             |
| `subnet_ids`             | `list(string)` | List of subnet IDs to associate with the database subnet group.             | `["subnet-1234", "subnet-5678"]`   |
| `subnet_group_name`      | `string`       | Name of the database subnet group.                                          | `"my_db_subnet_group"`             |
| `database_name`          | `string`       | Tag name for identifying the database instance.                             | `"my_sql_database"`                |

## Outputs

| Name               | Description                                                             |
|--------------------|-------------------------------------------------------------------------|
| `db_instance_id`   | The ID of the created RDS instance.                                     |
| `db_endpoint`      | The endpoint address of the RDS instance.                               |
| `db_port`          | The port on which the database is accessible.                           |

## Usage

```hcl
module "RDS" {
  source                 = "path/to/your/module"
  allocated_storage      = 10
  db_name                = "my_db_mysql"
  engine                 = "mysql"
  engine_version         = "8.0.34"
  instance_class         = "db.t3.micro"
  username               = "qtdevopsdb"
  password               = "qtdevopspass"
  vpc_security_group_ids = module.securitygroup.db_security_id
  skip_final_snapshot    = true
  database_name          = "my_sql_database"
  subnet_ids             = [
    module.vpc.private_subnet_id[0],
    module.vpc.private_subnet_id[1]
  ]
  subnet_group_name      = "my_db_subnet_group"
}
```

## Resources Created

This module creates the following AWS resources:

1. **RDS Instance**
   - `aws_db_instance.mysql_db`
2. **DB Subnet Group**
   - `aws_db_subnet_group.db_default`

## Prerequisites

- Terraform installed and configured.
- AWS CLI configured with appropriate credentials.
- Valid subnet IDs for the database subnet group.
- A security group allowing database connections.


