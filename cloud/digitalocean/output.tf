output socks5 {
  value = "${module.cloud-digitalocean.server_address}:${var.socks_port}"
}

output users {
  value = "${module.credentials.users}"
}
