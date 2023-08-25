resource "linode_instance" var.vm_name {
        image = var.vm_image
        label = var.vm_label
        group = var.vm_group
        region = var.region
        type = var.vm_type
        swap_size = 1024
        authorized_keys = var.authorized_keys
        root_pass = var.root_pass

        connection {
                type     = "ssh"
                user     = "root"
                password = var.root_pass
                host     = self.ip_address
        }

        provisioner "file" {
                source      = "../../../ansible/files/bootstrap"
                destination = "/tmp"
        }

        provisioner "remote-exec" {
                inline = [
                        "chmod u+x /tmp/bootstrap/*.sh",
                        "/tmp/bootstrap/requirements.sh",
                        "/tmp/bootstrap/run.sh tf_default",
                ]
        }

        output "ipv4_address" {
                value = self.ip_address
                description = "The IP address of the VM."
        }
}
