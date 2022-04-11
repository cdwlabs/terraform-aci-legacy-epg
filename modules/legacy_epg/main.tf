resource "aci_application_profile" "application" {
  count     = var.create_application_profile ? 1 : 0
  tenant_dn = data.aci_tenant.tenant.id
  name      = var.application_profile
}

resource "aci_bridge_domain" "bridge_domain" {
  name              = var.subnet_name
  description       = var.description
  multi_dst_pkt_act = "bd-flood"
  unk_mac_ucast_act = "flood"

  tenant_dn                = data.aci_tenant.tenant.id
  relation_fv_rs_ctx       = data.aci_vrf.vrf.id
  relation_fv_rs_bd_to_out = [data.aci_vrf.vrf_l3out.id]
  # relation_fv_rs_bd_to_relay_p = data.aci_dhcp_relay_policy.dhcp_relay_policy[0].id
}

resource "aci_subnet" "subnet" {
  count       = var.ip_subnet_gw != "" ? 1 : 0
  parent_dn   = aci_bridge_domain.bridge_domain.id
  ip          = var.ip_subnet_gw
  description = var.description
  # By default advertise this network in routing protocols
  scope = ["public"]
  # DHCP requests on this Brodge Domain will be sourced from this IP Subnet
  preferred = "yes"
}

resource "aci_application_epg" "epg" {
  application_profile_dn = var.create_application_profile == true ? aci_application_profile.application[0].id : data.aci_application_profile.application[0].id
  name                   = var.subnet_name
  description            = var.description
  relation_fv_rs_bd      = aci_bridge_domain.bridge_domain.id
}

resource "aci_epg_to_domain" "vmm" {
  count              = var.vmm_domain != "" ? 1 : 0
  application_epg_dn = aci_application_epg.epg.id
  tdn                = data.aci_vmm_domain.vmm[0].id
  instr_imedcy       = "immediate"
  res_imedcy         = "pre-provision"
}

resource "aci_bd_dhcp_label" "dhcp_label" {
  count            = var.dhcp_relay_policy != "" ? 1 : 0
  bridge_domain_dn = aci_bridge_domain.bridge_domain.id
  name             = data.aci_dhcp_relay_policy.dhcp_relay_policy[0].name
  # This might need adjustment for where your DHCP server is located - Assumed to be in the same ACI tenant
  # Options are [infra, tenant]
  owner = "tenant"
}