resource "yandex_compute_disk" "disk" {

  count = 3  
  name     = "disk-${count.index}"
  type     = "network-hdd"
  zone     = "ru-central1-a"
  size     = 1

}


resource "yandex_compute_instance" "storage" {
  
  depends_on  = [ yandex_compute_disk.disk ]   
  zone        = "ru-central1-a"
  name        = "storage"
  hostname    = "storage"
  platform_id = "standard-v2"
  
  resources {
    cores  = 2
    memory = 1
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      size = 10
      image_id = data.yandex_compute_image.ubuntu20.id
      type = "network-hdd"
    }
  }
  
  dynamic "secondary_disk" {
    for_each = toset(yandex_compute_disk.disk[*].id)
    content {
        disk_id = secondary_disk.value
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