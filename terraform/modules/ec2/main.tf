data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

/* resource "aws_iam_role" "meridian-role" {
  
} */

resource "aws_instance" "meridian" {
    ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.vpc_security_group_ids
  key_name                    = var.key_name

  //associate_public_ip_address = true

  //iam_instance_profile = aws_iam_instance_profile.instance_profile.name

  //user_data = file("${path.module}/user-data.sh")

  root_block_device {
    volume_size = 30
    volume_type = "gp3"
    encrypted   = true
  }

lifecycle {
    # Forces Terraform to wipe out the old resource before building the new one
    create_before_destroy = false
  }
  tags = {
    Name        = "${var.project_name}"
    Environment = var.environment
  }
}
