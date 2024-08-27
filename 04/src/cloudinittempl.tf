resource "local_file" "cloudinit_templ" {
  content = templatefile("${path.module}/cloud-init.tftpl",

  { username = "user"
    ssh_public_key = toset([ "${file("yandexkey.pub")~}", "testkey-1", "testkey-2" ])
  })

  filename = "${abspath(path.module)}/meta.yml"
}