variable "location" {
  type        = string
  description = "Name of the region for this infreastructure"
  default     = "West US 2"
}
variable "network_address" {
  type        = string
  description = "Cidr range for the Virtual Network"
  default     = "10.10.0.0/16"
}
variable "name" {
  type        = string
  description = "Name for this infrastructure"
  default     = "rg"
}
