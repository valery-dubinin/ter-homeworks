resource "yandex_vpc_network" "network" {
  name = var.env_name
}

resource "yandex_vpc_subnet" "subnet" {
  name           = local.subnet_name
  zone           = var.zone
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = var.cidr
}