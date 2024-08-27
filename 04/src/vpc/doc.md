## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~>1.8.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [yandex_vpc_network.network](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_network) | resource |
| [yandex_vpc_subnet.subnet](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr"></a> [cidr](#input\_cidr) | cidr, default is 10.0.10.0/24 | `list(string)` | <pre>[<br>  "10.0.10.0/24"<br>]</pre> | no |
| <a name="input_env_name"></a> [env\_name](#input\_env\_name) | name of network, default is net | `string` | `"net"` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | name of zone, default is ru-central1-a | `string` | `"ru-central1-a"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_net_id"></a> [net\_id](#output\_net\_id) | n/a |
| <a name="output_subnet_cidr"></a> [subnet\_cidr](#output\_subnet\_cidr) | n/a |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | n/a |
| <a name="output_subnet_name"></a> [subnet\_name](#output\_subnet\_name) | n/a |
