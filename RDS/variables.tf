variable "allocated_storage" {
    type=number
  
}

variable "db_name" {
    type = string
  
}

variable "engine" {
    type=string  
}

variable "engine_version" {
    type = string
  
}

variable "instance_class" {
    type = string
  
}


variable "username" {
    type = string
  
}

variable "password" {
    type = string
  
}



variable "skip_final_snapshot" {
  type = bool
  
}




variable "subnet_ids" {
  type = list(string)
  
}


variable "subnet_group_name" {
    type = string
  
}


variable "vpc_security_group_ids" {
    type = string
  
}


variable "database_name" {
    type=string
  
}