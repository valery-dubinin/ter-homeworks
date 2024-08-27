variable "env_name" {
    type = string
    default = "net"
    description = "name of network, default is net"
}

variable "zone" {
    type = string
    default = "ru-central1-a"
    description = "name of zone, default is ru-central1-a"
    validation {
     condition = contains(["ru-central1-a", "ru-central1-b", "ru-central1-c", "ru-central1-d"], var.zone)
     error_message = "Invalid zone provided."
   }
}

variable "cidr" {
    type = list(string)
    default = ["10.0.10.0/24"]
    description = "cidr, default is 10.0.10.0/24"
}

