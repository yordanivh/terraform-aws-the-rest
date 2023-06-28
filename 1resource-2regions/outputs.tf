output "ami_id-1" {
  description = "The AMI ID after apply"
  value       = data.aws_ami.ubuntu-1.id
}

output "instance_id-1" {
  description = "The id after apply"
  value       = resource.aws_instance.web-1.id
}

output "instance_id-2" {
  description = "The id after apply"
  value       = resource.aws_instance.web-2.id
}
