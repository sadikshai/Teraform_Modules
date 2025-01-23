# AWS Load Balancer Terraform Module

This Terraform module creates and configures an AWS Load Balancer, target groups, listeners, and target group attachments for your infrastructure.

---

## **Features**
- Creates an AWS Network Load Balancer.
- Configures target groups for health checks and traffic routing.
- Adds EC2 instances as targets for the load balancer.
- Exposes the load balancer DNS for access.

---

## **Inputs**
The following variables must be provided when using this module:

### **Load Balancer Configuration**
| Name               | Type   | Description                                          | Default  |
|--------------------|--------|------------------------------------------------------|----------|
| `aws_lb_name`      | string | The name of the load balancer.                       | -        |
| `aws_lb_internal`  | bool   | Indicates if the load balancer is internal.          | -        |
| `aws_lb_type`      | string | The type of load balancer (e.g., `network`).         | -        |
| `aws_lb_subnets`   | string | The public subnet ID where the load balancer resides.| -        |
| `aws_lb_protection`| bool   | Enable/disable deletion protection for the load balancer.| -        |
| `aws_lb_env`       | string | Environment tag for the load balancer (e.g., `dev`). | -        |

### **Target Group Configuration**
| Name                 | Type    | Description                                       | Default  |
|----------------------|---------|---------------------------------------------------|----------|
| `aws_target_name`    | string  | Name of the target group.                         | -        |
| `aws_target_port`    | number  | Port on which the target listens (e.g., `80`).    | -        |
| `aws_target_protocol`| string  | Protocol for the target group (e.g., `TCP`).      | -        |
| `aws_target_vpc_id`  | string  | VPC ID where the target group resides.            | -        |
| `healthy_threshold`  | number  | Number of healthy checks required to mark healthy.| -        |
| `unhealthy_threshold`| number  | Number of failed checks required to mark unhealthy.| -        |
| `aws_target_timeout` | number  | Timeout (in seconds) for health checks.           | -        |
| `aws_target_interval`| number  | Interval (in seconds) between health checks.      | -        |

### **Target Group Attachments**
| Name         | Type        | Description                                 | Default |
|--------------|-------------|---------------------------------------------|---------|
| `target_id`  | list(string)| List of EC2 instance IDs to attach as targets.| -      |

---

## **Usage**
Below is an example of how to use this module in your Terraform configuration:

```hcl
module "lb" {
  source = "github.com/sadikshai/Teraform_Modules//aws_lb"

  # Load balancer configuration
  aws_lb_name        = "cafe"
  aws_lb_internal    = false
  aws_lb_type        = "network"
  aws_lb_subnets     = module.vpc.public_subnet_id[0]
  aws_lb_protection  = false
  aws_lb_env         = "dev"

  # Target group configuration
  aws_target_name    = "cafe"
  aws_target_port    = 80
  aws_target_interval = 30
  aws_target_protocol = "TCP"
  aws_target_timeout = 5
  aws_target_vpc_id  = module.vpc.vpc_id
  healthy_threshold  = 2
  unhealthy_threshold = 2

  # Target group attachments
  target_id = module.ec2.instance_ids[*]
}


### Key Notes:
- The `Inputs` section clearly explains all the variables users need to provide.
- The example usage demonstrates how to configure the module.
