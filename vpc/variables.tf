variable "vpc_cidr_block" {
    type = string
  
}


variable "vpc_name" {
    type = string
  
}

variable "public_cidr_block" {
    type = list(string)
  
}

variable "public_availability_zone" {
    type = list(string)
  
}



variable "private_cidr_block" {
    type=list(string)
  
}


variable "private_availability_zone" {
    type = list(string)
  
}

