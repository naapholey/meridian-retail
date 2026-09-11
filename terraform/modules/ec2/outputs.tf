output "public_ip" {
  value = aws_instance.meridian.public_ip
}

output "public_dns" {
  value = aws_instance.meridian.public_dns
}

output "instance_id" {
  value = aws_instance.meridian.id
}
output "ec2_public_ip" {
  value = aws_instance.meridian.public_ip
}