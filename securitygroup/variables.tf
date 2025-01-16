

variable "web_security_name" {
    type = string
  
}

variable "web_security_group_description" {
    type = string
  
}

variable "web_security_group_tag_name" {
   type=string  
}


variable "web_security_group_rules" {
    type = list(object({
      cidr_ipv4   = optional(string, "0.0.0.0/0")
      from_port   = number
      to_port     = string
      ip_protocol = optional(string, "tcp") 
    }))
  
}




variable "db_security_name" {
    type = string
  
}

variable "db_security_group_description" {
    type = string
  
}

variable "db_security_group_tag_name" {
   type=string  
}


variable "db_security_group_rules" {
    type = list(object({
      cidr_ipv4   = optional(string, "0.0.0.0/0")
      from_port   = number
      to_port     = string
      ip_protocol = optional(string, "tcp") 
    }))
  
}


variable "public_subnet_count" {
    type = number
  
}

variable "private_subnet_count" {
    type = number
  
}

variable "vpc_id" {
    type = string
  
}


