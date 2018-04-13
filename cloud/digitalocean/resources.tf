module "credentials" {
  source  = "../../modules/credentials/"
  users   = "${var.users}"
}

module "cloud-init" {
  source  = "../../modules/cloud-init/"
  users   = "${join(",", module.credentials.users)}"
}

module "cloud-digitalocean" {
  source              = "../../modules/cloud-digitalocean/"
  image               = "${var.image["digitalocean"]}"
  size                = "${var.size["digitalocean"]}"
  region              = "${local.region}"
  public_key          = "${module.credentials.manage_ssh_key_public}"
  user_data           = "${module.cloud-init.user_data}"
  server_name         = "${var.server_name}"
}
