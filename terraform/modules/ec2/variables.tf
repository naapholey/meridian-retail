variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.small"
}

variable "subnet_id" {
  type        = string
  description = "subnet value"
}

variable "vpc_security_group_ids" {
  description = "List of IDs of security groups to associate with the EC2 instance"
  type        = list(string)
}

variable "key_name" {
  description = "Name of the EC2 key pair"
  type        = string
}

variable "project_name" {
  //default = "meridian-retail"
  type = string
}

variable "environment" {
  default = "dev"
}