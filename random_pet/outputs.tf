output "server-id" {
  description = "The ID of the server"
  value       = resource.aws_instance.random_pet.server.id
