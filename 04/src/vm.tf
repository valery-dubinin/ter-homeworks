#создаем облачную сеть
resource "yandex_vpc_network" "develop" {
  name = "develop"
}

#создаем подсеть
resource "yandex_vpc_subnet" "develop_a" {
  name           = "develop-ru-central1-a"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = ["10.0.1.0/24"]
}

resource "yandex_vpc_subnet" "develop_b" {
  name           = "develop-ru-central1-b"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = ["10.0.2.0/24"]
}


module "marketing-vm" {
  depends_on = [local_file.cloudinit_templ]  
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = "marketing" 
  network_id     = yandex_vpc_network.develop.id
  subnet_zones   = ["ru-central1-a","ru-central1-b"]
  subnet_ids     = [yandex_vpc_subnet.develop_a.id,yandex_vpc_subnet.develop_b.id]
  instance_name  = "webs"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = true

  labels = { 
    owner= "v.dubinin",
    project = "marketing"
    }

  metadata = {
    user-data          = local_file.cloudinit_templ.content #Поменял сам. meta.yml генерируется по шаблону с несколькими ключами
    serial-port-enable = 1
  }

}

module "analitics-vm" {
  depends_on = [local_file.cloudinit_templ]   
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = "analitics"
  network_id     = yandex_vpc_network.develop.id
  subnet_zones   = ["ru-central1-a"]
  subnet_ids     = [yandex_vpc_subnet.develop_a.id]
  instance_name  = "web-stage"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = true

  labels = { 
    owner= "v.dubinin",
    project = "analitics"
    }

  metadata = {
    user-data          = local_file.cloudinit_templ.content #Поменял сам. meta.yml генерируется по шаблону с несколькими ключами
    serial-port-enable = 1
  }
}

# Переменные данного data source могут быть только string, поэтому для создания cloud-init.yml 
# с несколькими ключами необходимо использовать функцию templatefile и описывать ее отдельно.
# Это сделано в файле cloudinittempl.tf

data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")
  vars = {
    username           = "user"
    ssh_public_key     = "${file("yandexkey.pub")}"
    }
}

