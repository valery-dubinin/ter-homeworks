variable "vms_resources" {
  type = map(object({
    cores = number,
    memory = number,
    core_fraction = number,
    disk_size = number
  }))
  default = {
    web = {
      cores = 2,
      memory = 1,
      core_fraction = 5
      disk_size = 10
    }
    storage = {
      cores = 2,
      memory = 1,
      core_fraction = 5
      disk_size = 10
    }
  }
}
