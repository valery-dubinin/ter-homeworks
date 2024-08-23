variable "each_vm" {
  type = list(object({  
    vm_name=string,
    cpu=number,
    ram=number,
    core_fraction=number,
    disk_volume=number
  }))
  default = [
    {
        vm_name = "main",
        cpu= 2,
        ram= 2,
        core_fraction= 5,
        disk_volume= 10
    },
    {
        vm_name = "replica",
        cpu= 2,
        ram= 1,
        core_fraction= 5,
        disk_volume= 10
    }
  ]  
}

resource "yandex_compute_instance" "foreach_instance" {
  
  for_each = { for vm in var.each_vm : vm.vm_name => vm } 
  # Данное выражение создает нам map из list (которым наша переменная изначально была), причем ключем становится имя машины. 
  # С list цикл for_each не работает. Честно говоря - списал. Сам бы делал сразу переменную типа map(object).
    
        zone        = "ru-central1-a"
        name        = each.key
        hostname    = each.value.vm_name
        platform_id = "standard-v2"
    
        resources {
            cores  = each.value.cpu
            memory = each.value.ram
            core_fraction = each.value.core_fraction
        }

        boot_disk {
            initialize_params {
            size = each.value.disk_volume
            image_id = data.yandex_compute_image.ubuntu20.id
            type = "network-hdd"
            }
        }

        scheduling_policy {
            preemptible = true
        }

        network_interface {
            subnet_id = yandex_vpc_subnet.develop.id
            security_group_ids = [yandex_vpc_security_group.example.id]
            nat       = true
        }

        metadata = {
            user-data = "${file("meta.yml")}"
            serial-port-enable = 1
        }
    
}