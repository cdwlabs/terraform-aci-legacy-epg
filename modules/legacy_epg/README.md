# legacy-vlan

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aci"></a> [aci](#provider\_aci) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aci_application_epg.epg](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/application_epg) | resource |
| [aci_application_profile.application](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/application_profile) | resource |
| [aci_bd_dhcp_label.dhcp_label](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/bd_dhcp_label) | resource |
| [aci_bridge_domain.bridge_domain](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/bridge_domain) | resource |
| [aci_epg_to_domain.vmm](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/epg_to_domain) | resource |
| [aci_subnet.subnet](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/subnet) | resource |
| [aci_application_profile.application](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/data-sources/application_profile) | data source |
| [aci_dhcp_relay_policy.dhcp_relay_policy](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/data-sources/dhcp_relay_policy) | data source |
| [aci_tenant.tenant](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/data-sources/tenant) | data source |
| [aci_vmm_domain.vmm](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/data-sources/vmm_domain) | data source |
| [aci_vrf.vrf](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/data-sources/vrf) | data source |
| [aci_vrf.vrf_l3out](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/data-sources/vrf) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_profile"></a> [application\_profile](#input\_application\_profile) | (Required) Name of the Application Profile where this EPG should be created | `string` | n/a | yes |
| <a name="input_create_application_profile"></a> [create\_application\_profile](#input\_create\_application\_profile) | (Optional) Conditional that allows for the creation of an application profile. Defaults to false | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | (Optional) Description of the Bridge Domain and EPG | `string` | `""` | no |
| <a name="input_dhcp_relay_policy"></a> [dhcp\_relay\_policy](#input\_dhcp\_relay\_policy) | (Optional) ID of the DHCP relay that should be used for this bridge domain | `string` | `""` | no |
| <a name="input_ip_subnet_gw"></a> [ip\_subnet\_gw](#input\_ip\_subnet\_gw) | (Optional) IP Subnet that will be configured on the Bridge Domain | `string` | `""` | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | (Required) Name of the Bridge Domain and EPG | `string` | n/a | yes |
| <a name="input_tenant"></a> [tenant](#input\_tenant) | (Required) ACI tenant name target for creation of the new Legacy EPG and associated components | `string` | n/a | yes |
| <a name="input_vmm_domain"></a> [vmm\_domain](#input\_vmm\_domain) | (Optional) Name of the Virtual Machine Manager to be used for the EPG (must be VMware) | `string` | `""` | no |
| <a name="input_vrf"></a> [vrf](#input\_vrf) | (Required) Name of the VRF to attach the Bridge Domain | `string` | n/a | yes |
| <a name="input_vrf_l3out"></a> [vrf\_l3out](#input\_vrf\_l3out) | (Required) Name of the L3out that the Bridge Domain will use for routing | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_application_profile"></a> [application\_profile](#output\_application\_profile) | Output of the resource block for the Application Profile that has been created |
| <a name="output_epg"></a> [epg](#output\_epg) | Output of the resource block for the Endpoint Group that has been created |
| <a name="output_existing_application_profile"></a> [existing\_application\_profile](#output\_existing\_application\_profile) | Output of the data block from the existing Tenant (if specified) |
| <a name="output_subnet"></a> [subnet](#output\_subnet) | Output of the resource block for the Subnet that has been created |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
