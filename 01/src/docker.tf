resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "hello_world"

  ports {
    internal = 80
    external = 9090
  }
}

resource "docker_image" "mysql" {
  name         = "mysql:8"
  keep_locally = true
}

resource "docker_container" "mysql" {
  image = docker_image.mysql.image_id
  name  = "mysql-terraform"

  ports {
    internal = 3306
    external = 3306
  }

  env = [ "MYSQL_ROOT_PASSWORD=${random_password.mysql_root_pass.result}", 
          "MYSQL_DATABASE=wordpress", 
          "MYSQL_USER=wordpress",
          "MYSQL_PASSWORD=${random_password.mysql_pass.result}",
          "MYSQL_ROOT_HOST=%" ]
}