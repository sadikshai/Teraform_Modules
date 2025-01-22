resource "aws_key_pair" "instance_key" {
    
    public_key = var.key_public_path
    key_name = var.key_name
}

data "aws_ami" "webimage" {
  most_recent=true
    filter {
      name = "name"
      values = [var.ami_filter_name]

    }
    owners=[var.ami_filter_owner]
  
}


resource "aws_instance" "web" {
  count=var.instance_count
  ami=data.aws_ami.webimage.id
  instance_type = var.instance_type
  key_name = aws_key_pair.instance_key.key_name
  associate_public_ip_address = var.associate_public_ip_address
  subnet_id = var.subnet_id
  vpc_security_group_ids = [var.vpc_security_group_ids]
  tags={
    Name="${var.instance_name}-${count.index}"
  }

  
}

resource "null_resource" "webnull" {
  count = var.instance_count
  triggers = {
    build_id=var.build_id
  }
  connection {
    type = "ssh"
    user=var.username
    private_key = var.key_private_path
    host=aws_instance.web[count.index].public_ip
  }
  provisioner "remote-exec" {
    script = var.script 
    
  }
  
}