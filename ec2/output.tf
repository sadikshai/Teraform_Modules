output "web_urls" {
  value = [for instance in aws_instance.web : format("http://%s", instance.public_ip)]
}

output "ssh_commands" {
  value = [for instance in aws_instance.web : format(
    "ssh -i %s %s@%s",
    var.key_private_path,
    var.username,
    instance.public_ip
  )]
}


output "Instance_id" {
  value = aws_instance.web.id
  
}