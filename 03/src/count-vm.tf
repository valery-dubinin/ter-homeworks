resource "yandex_compute_instance" "count-instance" {
  depends_on = [yandex_compute_instance.foreach-instance]
  count       = 2  
  zone        = "ru-central1-a"
  name        = "web-${count.index+1}"
  hostname    = "web-${count.index+1}"
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