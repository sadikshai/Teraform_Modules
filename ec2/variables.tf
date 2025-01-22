variable "key_public_path" {
    type=string
}

variable "key_private_path" {
   type=string  
}


variable "ami_filter_name" {
  type    = string
  default = "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"
}

variable "ami_filter_owner" {
  type = string
  default = "099720109477"
}

variable "associate_public_ip_address" {
  type = bool
  default = true
  
}


variable "instance_type" {
  type = string
  default = "t2.micro"
  
}

variable "username" {
  type = string
  default = "ubuntu"
}

variable "instance_name" {
  type = string
  
}

variable "subnet_id" {
  type = string
  
}


variable "vpc_security_group_ids" {
  type = string
  
}


variable "build_id" {
  type = string
  default = "1"
  
}


variable "script" {
  type=string   
}


variable "instance_count" {
  type = number
  
}