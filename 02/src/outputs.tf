output "test_output" {
  value = { 
        "db"= {
            "name" = yandex_compute_instance.platform_db.name,
            "nat" = yandex_compute_instance.platform_db.network_interface.0.nat_ip_address,
            "fqdn" = yandex_compute_instance.platform_db.fqdn
        },   
       "web"= {
            "name" = yandex_compute_instance.platform.name,
            "nat" = yandex_compute_instance.platform.network_interface.0.nat_ip_address,
            "fqdn" = yandex_compute_instance.platform.fqdn
        }, 
    }
}