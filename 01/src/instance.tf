resource "yandex_compute_instance" "dockerhost" {
  zone        = "ru-central1-a"
  name        = "dockerhost"
  hostname    = "dockerhost"
  platform_id = "standard-v2"
  
  resources {
    cores  = 2
    memory = 2
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      size = 10
      image_id = yandex_compute_image.ubuntu20.id
      type = "network-hdd"
    }
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    user-data = "${file("meta.yml")}"
    serial-port-enable = 1
  }
}