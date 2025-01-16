# EC2 Terraform Module

This module creates and provisions AWS EC2 instances using a key pair, AMI, and associated configurations. It supports remote provisioning using a script.

## Features

- Creates an EC2 key pair.
- Finds the latest AMI based on filters.
- Launches one or more EC2 instances with user-defined configurations.
- Provisions instances remotely using a script.
- Outputs instance URLs and SSH connection commands.

## Inputs

The following inputs must be provided by the user:

| Name                         | Type          | Description                                                                                     | Example Values                     |
|------------------------------|---------------|-------------------------------------------------------------------------------------------------|------------------------------------|
| `key_public_path`            | `string`      | Path to the public key file for the instance key pair.                                          | `"~/.ssh/id_rsa.pub"`            |
| `key_private_path`           | `string`      | Path to the private key file for SSH access.                                                   | `"~/.ssh/id_rsa"`                 |
| `key_name`                   | `string`      | Name of the key pair to create.                                                                | `"web_instance_key"`             |
| `ami_filter_name`            | `string`      | Filter name to find the AMI for the instance.                                                  | `"ubuntu/images/hvm-ssd-gp3/*"`  |
| `ami_filter_owner`           | `string`      | Owner of the AMI to be used.                                                                   | `"099720109477"`                 |
| `associate_public_ip_address`| `bool`        | Whether to associate a public IP address with the instance.                                    | `true`                             |
| `instance_type`              | `string`      | Instance type for the EC2 instances.                                                           | `"t2.micro"`                      |
| `username`                   | `string`      | SSH username for remote provisioning.                                                          | `"ubuntu"`                        |
| `instance_name`              | `string`      | Base name for the EC2 instances.                                                               | `"webinstance"`                   |
| `subnet_id`                  | `string`      | Subnet ID where the instances will be launched.                                                | `"subnet-12345678"`               |
| `vpc_security_group_ids`     | `string`      | Security group IDs to associate with the instances.                                            | `"sg-12345678"`                   |
| `build_id`                   | `string`      | Unique build ID for triggering resource changes.                                               | `"1"`                             |
| `script`                     | `string`      | Path to the script for remote provisioning of instances.                                        | `"./script.sh"`                   |
| `instance_count`             | `number`      | Number of instances to launch.                                                                 | `1`                                |

## Outputs

The following outputs are available:

| Name            | Description                                                                 |
|-----------------|-----------------------------------------------------------------------------|
| `web_urls`      | List of public URLs for the created EC2 instances.                          |
| `ssh_commands`  | List of SSH commands for connecting to the created EC2 instances.           |

## Usage

```hcl
module "ec2" {
  source                 = "path/to/your/module"
  instance_name          = "webinstance"
  vpc_security_group_ids = module.securitygroup.web_security_id
  key_public_path        = file("~/.ssh/id_rsa.pub")
  key_private_path       = file("~/.ssh/id_rsa")
  key_name               = "web_instance_key"
  subnet_id              = module.vpc.public_subnet_id[0]
  script                 = "./script.sh"
  ami_filter_owner       = "099720109477"
  ami_filter_name        = "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"
}
```

## Resources Created

This module creates the following AWS resources:

1. **Key Pair**
   - `aws_key_pair.instance_key`
2. **AMI Data Source**
   - `data.aws_ami.webimage`
3. **EC2 Instances**
   - `aws_instance.web`
4. **Null Resource for Remote Provisioning**
   - `null_resource.webnull`

## Prerequisites

- Terraform installed.
- AWS CLI configured with appropriate credentials.
- A valid SSH key pair for accessing instances.


