# Смотрим ресурсы

> terraform state list

module.analitics-vm.data.yandex_compute_image.my_image

module.analitics-vm.yandex_compute_instance.vm[0]

module.marketing-vm.data.yandex_compute_image.my_image

module.marketing-vm.yandex_compute_instance.vm[0]

module.vpc_dev.yandex_vpc_network.network

module.vpc_dev.yandex_vpc_subnet.subnet

# Ищем идентификаторы

> terraform state show module.analitics-vm.yandex_compute_instance.vm[0] | grep id

id                        = "fhmksoa0sa1k01sa3191"

> terraform state show module.marketing-vm.yandex_compute_instance.vm[0] | grep id

id                        = "fhmlavmkk89dq8fo6q4c"

> terraform state show module.vpc_dev.yandex_vpc_subnet.subnet | grep id

 id             = "e9b0fk0hgbi5v3r6hgh2"

> terraform state show module.vpc_dev.yandex_vpc_network.network | grep id

id                        = "enpgolbaoe8eh6bvaa8l"

# Удаляем ресурсы из state

> terraform state rm module.analitics-vm.yandex_compute_instance.vm[0]

> terraform state rm module.marketing-vm.yandex_compute_instance.vm[0]

> terraform state rm module.vpc_dev.yandex_vpc_subnet.subnet

> terraform state rm module.vpc_dev.yandex_vpc_network.network

# Импортируем ресурсы в state

> terraform import 'module.vpc_dev.yandex_vpc_network.network' enpgolbaoe8eh6bvaa8l

> terraform import 'module.vpc_dev.yandex_vpc_subnet.subnet' e9b0fk0hgbi5v3r6hgh2

> terraform import 'module.marketing-vm.yandex_compute_instance.vm[0]' fhmlavmkk89dq8fo6q4c

> terraform import 'module.analitics-vm.yandex_compute_instance.vm[0]' fhmksoa0sa1k01sa3191

