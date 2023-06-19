resource "vsphere_virtual_machine" "ansible01" {
  name             = "ansible01"
  resource_pool_id = data.vsphere_compute_cluster.compute_cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.ds01.id
  num_cpus         = 2
  memory           = 2048
  guest_id         = "ubuntu64Guest"
  network_interface {
    network_id = data.vsphere_network.net01.id
  }
  disk {
    label = "ansible-disk"
    size  = 50
    thin_provisioned = true
    eagerly_scrub = false
  }
  cdrom {
    path         = "/ISOs/ubuntu-22.04.2-live-server-amd64.iso"
    datastore_id = data.vsphere_datastore.ds01.id
  }
}

resource "vsphere_virtual_machine" "jenkins01" {
  name             = "jenkins01"
  resource_pool_id = data.vsphere_compute_cluster.compute_cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.ds02.id
  num_cpus         = 2
  memory           = 2048
  guest_id         = "ubuntu64Guest"
  network_interface {
    network_id = data.vsphere_network.net01.id
  }
  disk {
    label = "jenkins-disk"
    size  = 50
    thin_provisioned = true
    eagerly_scrub = false
  }
  cdrom {
    path         = "/ISOs/ubuntu-22.04.2-live-server-amd64.iso"
    datastore_id = data.vsphere_datastore.ds02.id
  }
}


resource "vsphere_virtual_machine" "kube01" {
  name             = "kube01"
  resource_pool_id = data.vsphere_compute_cluster.compute_cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.ds02.id
  num_cpus         = 4
  memory           = 4096
  guest_id         = "fedora64Guest"
  nested_hv_enabled = true
  network_interface {
    network_id = data.vsphere_network.net01.id
  }
  disk {
    label = "kube-disk"
    size  = 100
    thin_provisioned = true
    eagerly_scrub = false
  }
  cdrom {
    path         = "/ISOs/Fedora-Server-dvd-x86_64-38-1.6.iso"
    datastore_id = data.vsphere_datastore.ds02.id
  }
}
