# General data items
variable "tenant" {
  type        = string
  description = "(Required) ACI tenant name target for creation of the new Legacy EPG and associated components"
}
variable "vrf" {
  type        = string
  description = "(Required) Name of the VRF to attach the Bridge Domain"
}
variable "vrf_l3out" {
  type        = string
  description = "(Required) Name of the L3out that the Bridge Domain will use for routing"
}
variable "application_profile" {
  type        = string
  description = "(Required) Name of the Application Profile where this EPG should be created"
}
variable "create_application_profile" {
  type        = bool
  description = "(Optional) Conditional that allows for the creation of an application profile. Defaults to false"
  default     = false
}

# Information for the Bridge Domain and EPG
variable "subnet_name" {
  type        = string
  description = "(Required) Name of the Bridge Domain and EPG"
}
variable "description" {
  type        = string
  description = "(Optional) Description of the Bridge Domain and EPG"
  default     = ""
}
variable "ip_subnet_gw" {
  type        = string
  description = "(Optional) IP Subnet that will be configured on the Bridge Domain"
  default     = ""
}


variable "dhcp_relay_policy" {
  type        = string
  description = "(Optional) ID of the DHCP relay that should be used for this bridge domain "
  default     = ""
}
variable "vmm_domain" {
  type        = string
  description = "(Optional) Name of the Virtual Machine Manager to be used for the EPG (must be VMware)"
  default     = ""
}
# variable "" {
#   type = string
#   description = "(Optional)(Required) "
#   default = ""
# }