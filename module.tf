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
  resource_group_name = local.rg 
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name                  = var.default_node_pool.name 
    node_count            = var.default_node_pool
    vm_size               = var.default_node_pool.vm_size
    enable_auto_scaling   = var.default_node_pool.enable_auto_scaling
    enable_node_public_ip = var.default_node_pool.enable_node_public_ip
    os_disk_size_gb       = var.default_node_pool.os_disk_size_gb
    max_pods              = var.default_node_pool.max_pods
    node_taints           = var.default_node_pool.node_taints
    type                  = var.default_node_pool.type
    vnet_subnet_id        = var.default_node_pool.vnet_subnet_id
    max_count             = var.default_node_pool.max_count
    min_count             = var.default_node_pool.min_count
  }

  service_principal {
    client_id     = var.service_principal.client_id
    client_secret = var.service_principal.client_secret
  }
  
   tags = var.tags
}