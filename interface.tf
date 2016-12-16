variable "environment" {
  description = "The name of our environment, i.e. development."
}

variable "key_name" {
  description = "The AWS key pair to use for resources."
}

variable "public_subnet_id" {
  description = "The public subnet to populate."
}

variable "instance_type" {
  default     = "t2.micro"
  description = "The instance type to launch "
}

variable "vpc_id" {
  description = "The VPC ID to launch in"
}

variable "domain" {
  description = "The domain of the site"
}

variable "app" {
  description = "Name of application"
}

variable "role" {
  description = "Role of servers"
}

output "prometheus_host_address" {
  value = ["${aws_eip.prometheus.public_ip}"]
}

output "prometheus_private_address" {
  value = ["${aws_instance.prometheus.private_ip}"]
}
