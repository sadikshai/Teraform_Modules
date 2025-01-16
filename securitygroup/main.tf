resource "aws_security_group" "web" {
    name = var.web_security_name
    description = var.web_security_group_description
    vpc_id = var.vpc_id
    tags = {
        Name=var.web_security_group_tag_name
    }

  
}

resource "aws_vpc_security_group_ingress_rule" "web" {
    count = length(var.web_security_group_rules)
    security_group_id = aws_security_group.web.id
    from_port = var.web_security_group_rules[count.index].from_port
    to_port = var.web_security_group_rules[count.index].to_port
    ip_protocol = var.web_security_group_rules[count.index].ip_protocol
    cidr_ipv4 = var.web_security_group_rules[count.index].cidr_ipv4
  
}


resource "aws_vpc_security_group_egress_rule" "web" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         ="0.0.0.0/0"
  ip_protocol       = -1
}
  




resource "aws_security_group" "db" {
    name = var.db_security_name
    description = var.db_security_group_description
    vpc_id = var.vpc_id
    tags = {
        Name=var.db_security_group_tag_name
    }

  
}

resource "aws_vpc_security_group_ingress_rule" "db" {
    count = length(var.db_security_group_rules)
    security_group_id = aws_security_group.db.id
    from_port = var.db_security_group_rules[count.index].from_port
    to_port = var.db_security_group_rules[count.index].to_port
    ip_protocol = var.db_security_group_rules[count.index].ip_protocol
    cidr_ipv4 = var.db_security_group_rules[count.index].cidr_ipv4
  
}


resource "aws_vpc_security_group_egress_rule" "db" {
  security_group_id = aws_security_group.db.id
  cidr_ipv4         ="0.0.0.0/0"
  ip_protocol       = -1
}
