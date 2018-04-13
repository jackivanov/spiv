output socks5 {
  value = "${module.cloud-digitalocean.server_address}:443"
}

output users {
  value = "${module.credentials.users}"
}
