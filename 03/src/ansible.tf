resource "local_file" "hosts_templatefile" {
  content = templatefile("${path.module}/hosts.tftpl",

  { webservers = yandex_compute_instance.count_instance,
    databases = yandex_compute_instance.foreach_instance
    storage = [ yandex_compute_instance.storage ]
  })

  filename = "${abspath(path.module)}/hosts.ini"
}