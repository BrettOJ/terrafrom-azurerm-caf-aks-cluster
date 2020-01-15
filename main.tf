# merge tags with lower level tags
locals {
  module_tag          = {
    "module" = basename(abspath(path.module))
  }
  tags       = merge(var.tags,local.module_tag)

}
#retrieve the version of Kubernetes supported by Azure Kubernetes Service.
data "azurerm_kubernetes_service_versions" "current" {
  location = var.location
}

