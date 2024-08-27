module "vpc_dev" {
  source       = "./vpc"
  env_name     = "testnet"
  zone = "ru-central1-a"
  cidr = ["10.0.1.0/24"]
}

