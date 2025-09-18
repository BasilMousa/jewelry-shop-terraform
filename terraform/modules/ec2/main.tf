resource "aws_instance" "app_server" {
  count         = var.app_server_count
  ami           = data.aws_ami.linux.id
  instance_type = var.ec2_instance_type
  subnet_id     = var.private_subnet_ids[count.index]
  vpc_security_group_ids = [var.ec2_sg_id]
  key_name      = var.key_name

  tags = {
    Name = "${var.app_server_name_prefix}-${count.index + 1}"
  }
}

resource "aws_instance" "ansible_host" {
  ami           = data.aws_ami.linux.id
  instance_type = var.ec2_instance_type
  subnet_id     = var.public_subnet_id
  vpc_security_group_ids = [var.ansible_sg_id]
  key_name      = var.key_name

  tags = {
    Name = var.ansible_host_name
  }
}

data "aws_ami" "linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}
