resource "digitalocean_ssh_key" "main" {
  name       = "${var.server_name}"
  public_key = "${var.public_key}"
}

resource "digitalocean_tag" "main" {
  name = "Environment:Spiv"
}

resource "digitalocean_droplet" "main" {
  name      = "${var.server_name}"
  image     = "${var.image}"
  size      = "${var.size}"
  region    = "${var.region}"
  user_data = "${var.user_data}"
  tags      = [ "${digitalocean_tag.main.id}" ]
  ssh_keys  = [ "${digitalocean_ssh_key.main.id}" ]
  ipv6      = false
}


resource "digitalocean_floating_ip" "main" {
  droplet_id = "${digitalocean_droplet.main.id}"
  region     = "${digitalocean_droplet.main.region}"
}

output server_address {
  value = "${digitalocean_floating_ip.main.ip_address}"
}
