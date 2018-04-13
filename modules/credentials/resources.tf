resource "tls_private_key" "manage" {
  algorithm   = "RSA"
  rsa_bits    = "2048"
}

output manage_ssh_key_private {
  value = "${tls_private_key.manage.private_key_pem}"
}

output manage_ssh_key_public {
  value = "${tls_private_key.manage.public_key_openssh}"
}

resource "local_file" "manage" {
    content   = "${tls_private_key.manage.private_key_pem}"
    filename  = "${path.cwd}/configs/spiv.pem"

    provisioner "local-exec" {
      command = "chmod 0600 ${path.cwd}/configs/spiv.pem"
  }
}

resource "tls_private_key" "users" {
  count       = "${length(var.users)}"
  algorithm   = "ECDSA"
  ecdsa_curve = "P384"
}

output users_key_private {
  value = [
    "${tls_private_key.users.*.private_key_pem}"
  ]
}

output users_key_public {
  value = [
    "${tls_private_key.users.*.public_key_openssh}"
  ]
}

resource "random_string" "passwords" {
  count   = "${length(var.users)}"
  length  = 8
  upper   = true
  lower   = true
  number  = true
  special = false
}

data "template_file" "passwords" {
  count    = "${length(var.users)}"
  template = "$${user}:$${password}"
  vars {
    user     = "${element(var.users, count.index)}"
    password = "${element(random_string.passwords.*.result, count.index)}"
  }
}

output users {
  value = [
    "${data.template_file.passwords.*.rendered}"
  ]
}

output passwords {
  value = [
    "${random_string.passwords.*.result}"
  ]
}
