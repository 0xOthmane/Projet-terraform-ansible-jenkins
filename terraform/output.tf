output "ansible_ip" {
  value = vsphere_virtual_machine.ansible01.guest_ip_addresses[0]
}
output "jenkins_ip" {
  value = vsphere_virtual_machine.jenkins01.guest_ip_addresses[0]
}
output "kube_ip" {
  value = vsphere_virtual_machine.kube01.guest_ip_addresses[0]
}