

data "vsphere_datacenter" "prod_datacenter" {
  name = "prod_datacenter"
  provider = vsphere
}

data "vsphere_compute_cluster" "compute_cluster" {
  name          = "compute-cluster"
  datacenter_id = data.vsphere_datacenter.prod_datacenter.id
}

data "vsphere_host" "esx01" {
  name          = "192.168.86.131"
  datacenter_id = data.vsphere_datacenter.prod_datacenter.id
}

data "vsphere_datastore" "ds01" {
  name          = "datastore1 (1)"
  datacenter_id = data.vsphere_datacenter.prod_datacenter.id
}
data "vsphere_datastore" "ds02" {
  name          = "datastore1"
  datacenter_id = data.vsphere_datacenter.prod_datacenter.id
}
data "vsphere_network" "net01" {
  name          = "VM Network"
  datacenter_id = data.vsphere_datacenter.prod_datacenter.id
}

