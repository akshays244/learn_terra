output "server_name" {
    value  =[ for instance in google_compute_instance.vm:instance.name]
    description = "name of each instance is "
  
}
output "private_ip_addresses" {
  value       = [for instance in google_compute_instance.vm : instance.network_interface.0.network_ip]
  description = "The private IP address of each server instance."
}

output "public_ip_addresses" {
  value       = [for instance in google_compute_instance.vm : instance.network_interface.0.access_config.0.nat_ip]
  description = "The public IP address of each server instance."
}