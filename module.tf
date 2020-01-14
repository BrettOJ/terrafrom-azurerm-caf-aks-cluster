module "azurerm_resource_group" {
    source  = "aztfmod/caf-resource-group/azurerm"
    version = "0.1.2"

    prefix          = var.prefix
    resource_groups = var.resource_groups
    tags            = local.tags
}

module "caf_name_gen" {
  source  = "aztfmod/caf-naming/azurerm"
  version = "~> 0.1.0"
    
  name    = var.aks_cluster_name
  type    = "gen"
  convention  = var.naming_convention
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = module.caf_name_gen.gen
  location            = var.location
  resource_group_name = local.resource_group 
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name       = var.default_node_pool.name 
    node_count = 1
    vm_size    = var.default_node_pool.vm_size
    enable_auto_scaling = var.default_node_pool.enable_auto_scaling
    enable_node_public_ip = var.default_node_pool.enable_node_public_ip
  }

  service_principal {
    client_id     = var.service_principal.client_id
    client_secret = var.service_principal.client_secret
  }


 tags = var.tags
}