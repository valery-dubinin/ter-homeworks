###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
  }

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}


###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDQgtrYeIGxZ/Cosunu8JlMUH8nBss2cgtUxh/RsjJN/ user@user-VirtualBox"
  description = "ssh-keygen -t ed25519"
}

### vm vars

variable vm_web_family {
  type = string
  default = "ubuntu-2004-lts"
  description = "family of image"
}

variable vm_web_name {
  type = string
  default = "netology-develop-platform-web"
  description = "name of vm"
}

variable vm_web_platform_id {
  type = string
  default = "standard-v1"
  description = "platform_id of vm"
}

variable vm_web_cores {
  type = string
  default = 2
  description = "cores of vm"
}

variable vm_web_memory {
  type = string
  default = 1
  description = "memory in Gb of vm"
}

variable vm_web_core_fraction {
  type = string
  default = 5
  description = "core_fraction in % of vm"
}

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