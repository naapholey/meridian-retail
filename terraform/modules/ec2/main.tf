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

 resource "aws_iam_role" "meridian" {
  name = "${var.project_name}-ec2-role"
   # Forces Terraform to wipe out the old resource before building the new one
  
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
} 

/* resource "aws_iam_policy" "meridian" {
   name = "${var.project_name}-role-policy"
 # Forces Terraform to wipe out the old resource before building the new one
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "secretsmanager:GetSecretValue",
          "secretsmanager:DescribeSecret"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
} */

resource "aws_iam_role_policy_attachment" "attach_policy" {
  role       = aws_iam_role.meridian.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
  //policy_arn = aws_iam_policy.meridian.arn
}
resource "aws_iam_role_policy_attachment" "ecr_attach_policy" {
 role       = aws_iam_role.meridian.name
 policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly" 
}
resource "aws_iam_instance_profile" "meridian" {
  name = "${var.project_name}-instance-profile"
  role = aws_iam_role.meridian.name
}

resource "aws_instance" "meridian" {
    ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.vpc_security_group_ids
  key_name                    = var.key_name
  associate_public_ip_address = true
  iam_instance_profile = aws_iam_instance_profile.meridian.name

  root_block_device {
    volume_size = 30
    volume_type = "gp3"
    encrypted   = true
  }

  tags = {
    Name        = "${var.project_name}"
    Environment = var.environment
  }
}
