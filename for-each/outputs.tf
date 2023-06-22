output "IAM-user-id" {
  description = "The ids of IAM users created"
  value       = { 
    for k, v in aws_iam_user.edu: k => v.id
  }
}

output "vpc-id" {
  description = "The IDs of created subnets"
  value       = {for k, v in aws_subnet.vpc-subnet: k => v.id}
}
