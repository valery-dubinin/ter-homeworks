locals {
    vm_web_name = "netology-${var.env}-platform-${var.project_web}"
    vm_db_name = "netology-${var.env}-platform-${var.project_db}"
    ssh-keys = "ubuntu:${var.vms_ssh_root_key}"
}