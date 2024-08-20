### vm vars

variable vm_web_family {
  type = string
  default = "ubuntu-2004-lts"
  description = "family of image"
}

#variable vm_web_name {
#  type = string
#  default = "netology-develop-platform-web"
#  description = "name of vm"
#}

variable vm_web_platform_id {
  type = string
  default = "standard-v1"
  description = "platform_id of vm"
}

#variable vm_web_cores {
#  type = string
#  default = 2
#  description = "cores of vm"
#}

#variable vm_web_memory {
#  type = string
#  default = 1
#  description = "memory in Gb of vm"
#}

#variable vm_web_core_fraction {
#  type = string
#  default = 5
#  description = "core_fraction in % of vm"
#}

variable vm_web_preemptible {
  type = bool
  default = true
  description = "is vm preemptible"
}

variable vm_web_nat {
  type = bool
  default = true
  description = "Is there nat in vm"
}

####

#variable vm_db_name {
#  type = string
#  default = "netology-develop-platform-db"
#  description = "name of vm"
#}

#variable vm_db_cores {
#  type = string
#  default = 2
#  description = "cores of vm"
#}

#variable vm_db_memory {
#  type = string
#  default = 2
#  description = "memory in Gb of vm"
#}

#variable vm_db_core_fraction {
#  type = string
#  default = 20
#  description = "core_fraction in % of vm"
#}

variable vm_db_zone {
  type = string
  default = "ru-central1-b"
  description = "zone of of vm"
}


variable "vm_db_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vm_db_vpc_name" {
  type        = string
  default     = "db-develop"
  description = "VPC network & subnet name"
}

variable "env" {
  type        = string
  default     = "develop"
  description = "name of environment"
}

variable "project_web" {
  type        = string
  default     = "web"
  description = "name of project web"
}

variable "project_db" {
  type        = string
  default     = "db"
  description = "name of project db"
}

#### К 6 заданию

variable "vms_resources" {
  type = map(object({
    cores = number,
    memory = number,
    core_fraction = number
  }))
  default = {
    web = {
      cores = 2,
      memory = 1,
      core_fraction = 5
    }
    db = {
      cores = 2,
      memory = 2,
      core_fraction = 20
    }
  }
}

variable "metadata" {
  type = map(object({
    serial-port-enable = number,
    ssh-keys = string,
  }))
  default = {
    web = {
      serial-port-enable = 1
      ssh-keys = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDQgtrYeIGxZ/Cosunu8JlMUH8nBss2cgtUxh/RsjJN/ user@user-VirtualBox"
    }
    db = {
      serial-port-enable = 1
      ssh-keys = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDQgtrYeIGxZ/Cosunu8JlMUH8nBss2cgtUxh/RsjJN/ user@user-VirtualBox"
    }
  }
}