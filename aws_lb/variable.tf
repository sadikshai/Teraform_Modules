variable "aws_lb_name" {
    type = string
  
}

variable "aws_lb_internal" {
    type = bool
  
}

variable "aws_lb_type" {
    type = string
  
}


variable "aws_lb_subnets" {
    type = string
  
}


variable "aws_lb_protection" {
    type = bool
  
}


variable "aws_lb_env" {
    type = string
  
}



variable "aws_target_name" {
    type = string
  
}

variable "aws_target_port" {
    type = number
  
}


variable "aws_target_protocol" {
    type = string
  
}



variable "aws_target_vpc_id" {
 type = string
  
}




variable "healthy_threshold" {
    type = number
  
}

variable "unhealthy_threshold" {
    type = number
  
}


variable "aws_target_timeout" {
    type = number
  
}


variable "aws_target_interval" {
    type = number
  
}


variable "target_id" {
    type = list(string)
  
}


