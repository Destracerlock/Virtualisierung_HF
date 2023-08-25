variable "vm_name" {
    description = "The name for the VM"
    default = lower(var.vm_label)
}

variable "vm_image" { 
    description = "The default Linode image for the VM"
    default = "linode/almalinux9"
}

variable "vm_label" {
    description = "The label for the VM"
    default = "Almalinux9-test"
}

variable "vm_group" {
    description = "The default groupe the VM is in"
    default = "Terraform"
}

variable "vm_type" {
    description = "The size (plan) for the VM"
    default = "g6-nanode-1" # or g6-standard-1
}

variable "region" {
    description = "The default Linode region to deploy the infrastructure"
    default = "eu-central"
}

variable "authorized_keys" {
    description = "The Public id_rsa.pub key used for secure SSH connections"
}

variable "root_pass" {
    description = "The default root password for the Linode server"
    sensitive = true
}