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


output "instance_ids" {
  value = aws_instance.web[*].id  # Use the splat operator to get all instance IDs
}


output "web_count" {
  value = length(aws_instance.web)  # Get the number of instances
}