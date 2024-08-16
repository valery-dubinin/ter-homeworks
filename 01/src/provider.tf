# Переменные образов

resource "yandex_compute_image" "ubuntu20" {
  source_family = "ubuntu-2004-lts"
}

# Настройка провайдера

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = "~>1.8.4" /*Многострочный комментарий.
 Требуемая версия terraform */
}

provider "docker" {
#  host     = "ssh://user@89.169.140.244:22"
#  ssh_opts = ["-o", "IdentityFile=/home/user/yandexkey", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null"]
}


provider "yandex" {

  token      = var.yc_token
  cloud_id  = var.yc_cloud_id
  folder_id = var.yc_folder_id
  zone      = "ru-central1-a"
}