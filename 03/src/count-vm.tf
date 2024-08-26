resource "yandex_compute_instance" "count_instance" {
  depends_on = [yandex_compute_instance.foreach_instance]
  count       = 2  
  zone        = "ru-central1-a"
  name        = "web-${count.index+1}"
  hostname    = "web-${count.index+1}"
  platform_id = "standard-v2"
  
  resources {
    cores  = var.vms_resources.web.cores
    memory = var.vms_resources.web.memory
    core_fraction = var.vms_resources.web.core_fraction
  }

  boot_disk {
    initialize_params {
      size = var.vms_resources.web.disk_size
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