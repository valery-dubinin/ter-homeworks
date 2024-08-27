output "subnet_name" {
    value = yandex_vpc_subnet.subnet.name
}

output "net_id" {
    value = yandex_vpc_network.network.id
}

output "subnet_id"{
    value = yandex_vpc_subnet.subnet.id
}

output "subnet_cidr"{
    value = yandex_vpc_subnet.subnet.v4_cidr_blocks
}
