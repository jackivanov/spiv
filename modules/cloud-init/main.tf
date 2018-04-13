data "template_file" "cloud_init" {
  template = "${file("${path.module}/files/cloud-init.yml")}"
  vars {
    users = "${var.users}"
  }
}

data "template_cloudinit_config" "cloud_init" {
  gzip           = false
  base64_encode  = false
  part {
    filename     = "main"
    content      = "${data.template_file.cloud_init.rendered}"
  }
}

output "user_data" {
  value = "${data.template_cloudinit_config.cloud_init.rendered}"
}
