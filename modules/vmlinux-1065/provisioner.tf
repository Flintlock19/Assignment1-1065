resource "null_resource" "display_hostnames" {
  for_each = azurerm_linux_virtual_machine.linux_vm

  provisioner "remote-exec" {
    inline = ["hostname"]
    connection {
      type        = "ssh"
      host        = azurerm_public_ip.linux_public_ip[each.key].ip_address
      user        = var.admin_username
      private_key = file(var.private_key)
    }
  }

  depends_on = [
    azurerm_linux_virtual_machine.linux_vm
  ]
}

