data "aci_tenant" "tenant" {
  name = var.tenant
}

data "aci_vrf" "vrf" {
  name      = var.vrf
  tenant_dn = data.aci_tenant.tenant.id
}

data "aci_vrf" "vrf_l3out" {
  name      = var.vrf
  tenant_dn = data.aci_tenant.tenant.id
}

data "aci_application_profile" "application" {
  count     = var.create_application_profile != true ? 1 : 0
  name      = var.application_profile
  tenant_dn = data.aci_tenant.tenant.id
}

data "aci_dhcp_relay_policy" "dhcp_relay_policy" {
  count     = var.dhcp_relay_policy != "" ? 1 : 0
  tenant_dn = data.aci_tenant.tenant.id
  name      = var.dhcp_relay_policy
}

data "aci_vmm_domain" "vmm" {
  count               = var.vmm_domain != "" ? 1 : 0
  provider_profile_dn = "uni/vmmp-VMware"
  name                = var.vmm_domain
}