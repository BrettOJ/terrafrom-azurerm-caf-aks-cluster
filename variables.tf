variable "resource_groups" {
  description = "(required) map of the resource groups to be created"
}

variable "prefix" {
  description = "A prefix used for all resources in this example"
}

variable "location" {
  description = "(required)The Azure Region in which all resources in this example should be provisioned"
}

variable "tags" {

}

variable "service_principal" {
  description = "The Client ID and client secret block for the Service Principal to use for this Managed Kubernetes Cluster"
}

variable "aks_cluster_name" {

}

variable "log_analytics_workspace_id" {

}

variable "diagnostics_map" {

}

variable "diag_object" {

}
variable "dns_prefix" {

}
variable "naming_convention" {

}
variable "default_node_pool" {

}

