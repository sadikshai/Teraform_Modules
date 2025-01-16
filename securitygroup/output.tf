output "web_security_id" {
    value = aws_security_group.web.id
  
}

output "db_security_id" {
    value = aws_security_group.db.id
  
}