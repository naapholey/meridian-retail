variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "The default cidr value"
  type        = string
}

variable "vpc_name" {
  default     = "meridian-retail"
  description = "Name of vpc"
  type        = string
}

variable "environment" {
  description = "environment of the service"
  default     = "dev"
  type        = string
}
variable "public_subnet_cidrs" {
  description = "pbulic subnets cidr"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
  type        = list(string)
}

variable "availability_zones" {
  default     = ["us-east-1a", "us-east-1b"]
  type        = list(string)
  description = "values for availability zones"
}

variable "private_subnet_cidr" {
  description = "pbulic subnets cidr"
  default     = ["10.0.10.0/24", "10.0.11.0/24"]
  type        = list(string)
}
variable "instance_type" {
  default = "t3.micro"
}

variable "key_name" {
  default = "tech-flow"
}

variable "project_name" {
  default = "meridian-app"
}
variable "runner_ssh_ip" {
  description = "Public IP of the GitHub Actions runner for SSH access"
  type        = string
  default     = "0.0.0.0/0"
}