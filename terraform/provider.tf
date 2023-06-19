terraform {
  required_providers {
    vsphere = {
      source = "hashicorp/vsphere"
      version = "2.3.1"
    }
  }
}

# Provider
provider "vsphere" {
  user = var.vsphere_user
  password = var.vsphere_password
  vsphere_server = var.vsphere_server

  allow_unverified_ssl = true
}

# Variables
variable "vsphere_server" {
  type = string
  default = "default-value"
}
variable "vsphere_user" {
  type = string
  default = "default-value"
}
variable "vsphere_password" {
  type = string
  default = "default-value"
}

