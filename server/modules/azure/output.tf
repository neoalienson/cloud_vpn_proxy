output "ip" {
  value = azurerm_public_ip.proxy.ip_address
}

output "command" {
  description = "Command to setup ssh tunnel to the proxy server"
  value = format("ssh-keygen -R %s; ssh -L3128:localhost:3128 %s@%s",
    azurerm_public_ip.proxy.ip_address,
    var.ssh_username,
  azurerm_public_ip.proxy.ip_address)
}