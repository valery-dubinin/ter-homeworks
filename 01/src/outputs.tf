output "dockerhost_nat" {
  value = yandex_compute_instance.dockerhost.network_interface.0.nat_ip_address
}