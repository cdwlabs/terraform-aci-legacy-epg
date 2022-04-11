# terraform-aci-legacy-epg
Public repository for Cisco DevNet.  This repository includes a module for use with Cisco ACI fabric and interfaces with an APIC to perform the following:

Create:
* Bridge Domain with a single Single IP Subnet (set for DHCP - optional)
* Application Profile (optional)
* End-Point Group (EPG) (added to a VMware VMM - optional) associated with the Bridge Domain

## Instructions

### Authentication/Credentials

1. The Cisco ACI provider will use Environment Variables on your computer to authenticate to the Cisco ACI APIC.  
1. The file `credentials` shows an example of the names, and values.
1. This credentials file is setup for the publicly known/available information and is not a security risk.
1. **NEVER** save your production secrets into a git repository.

### Testing

1. The code is currently configured for use with the always on Cisco ACI Sandbox.  1. The following commands (on MacOS or Linux) should produce a new Bridge Domain, IP Subnet, Application Profile, and EPG in the `common` tenant.

    ```bash
    source credentials.sh
    cp epg-200.tf.example epg-200.tf
    terraform init
    terraform apply --auto-approve
    ```

### Production Use

1. There is an example use in file `epg-200.tf.example`
1. Copy the example file above to a new file ending with `.tf`

    ```bash
    cp epg-200.tf.example {{new_file_name.tf}}
    ```

1. Edit the new file to match your specific needs.  It should be fairly obvious what needs to be changed.
    1. The `subnet_name` will be the name for the Bridge Domain, and EPG
    1. Comment out the `create_application_profile` if you already have an AP you want to use.  
    1. If you are planning to have many EPGs in one AP, then create the AP manually and comment this out.

1. Once you have completed the changes, save the file.
1. Run `terraform init` to download the provider and initialize the modules.
1. Run `terraform plan` to see what changes would be made.
1. Run `terraform apply` to make your changes.

## Example

```bash
terraform-aci-legacy_epg(main) ▶ source credentials.sh
terraform-aci-legacy_epg(main) ▶ cp epg-200.tf.example epg-200.tf
terraform-aci-legacy_epg(main) ▶ terraform init
Initializing modules...
- legacy_epg in modules/legacy_epg

Initializing the backend...

Initializing provider plugins...
- Reusing previous version of ciscodevnet/aci from the dependency lock file
- Installing ciscodevnet/aci v2.1.0...
- Installed ciscodevnet/aci v2.1.0 (signed by a HashiCorp partner, key ID 433649E2C56309DE)

Partner and community providers are signed by their developers.
If you`d like to know more about provider signing, you can read about it here:
https://www.terraform.io/docs/cli/plugins/signing.html

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
terraform-aci-legacy_epg(main) ▶ terraform apply --auto-approve
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.legacy_epg.aci_application_epg.epg will be created
  + resource "aci_application_epg" "epg" {
      + annotation                  = "orchestrator:terraform"
      + application_profile_dn      = (known after apply)
      + description                 = "Legacy VLAN 200 - 10.1.200/24"
      + exception_tag               = (known after apply)
      + flood_on_encap              = (known after apply)
      + fwd_ctrl                    = (known after apply)
      + has_mcast_source            = (known after apply)
      + id                          = (known after apply)
      + is_attr_based_epg           = (known after apply)
      + match_t                     = (known after apply)
      + name                        = "legacy-200"
      + name_alias                  = (known after apply)
      + pc_enf_pref                 = (known after apply)
      + pref_gr_memb                = (known after apply)
      + prio                        = (known after apply)
      + relation_fv_rs_bd           = (known after apply)
      + relation_fv_rs_cust_qos_pol = (known after apply)
      + shutdown                    = (known after apply)
    }

  # module.legacy_epg.aci_application_profile.application[0] will be created
  + resource "aci_application_profile" "application" {
      + annotation                = "orchestrator:terraform"
      + description               = (known after apply)
      + id                        = (known after apply)
      + name                      = "legacy_networks"
      + name_alias                = (known after apply)
      + prio                      = (known after apply)
      + relation_fv_rs_ap_mon_pol = (known after apply)
      + tenant_dn                 = "uni/tn-common"
    }

  # module.legacy_epg.aci_bridge_domain.bridge_domain will be created
  + resource "aci_bridge_domain" "bridge_domain" {
      + annotation                  = "orchestrator:terraform"
      + arp_flood                   = (known after apply)
      + bridge_domain_type          = (known after apply)
      + description                 = "Legacy VLAN 200 - 10.1.200/24"
      + ep_clear                    = (known after apply)
      + ep_move_detect_mode         = (known after apply)
      + host_based_routing          = (known after apply)
      + id                          = (known after apply)
      + intersite_bum_traffic_allow = (known after apply)
      + intersite_l2_stretch        = (known after apply)
      + ip_learning                 = (known after apply)
      + ipv6_mcast_allow            = (known after apply)
      + limit_ip_learn_to_subnets   = (known after apply)
      + ll_addr                     = (known after apply)
      + mac                         = (known after apply)
      + mcast_allow                 = (known after apply)
      + multi_dst_pkt_act           = "bd-flood"
      + name                        = "legacy-200"
      + name_alias                  = (known after apply)
      + optimize_wan_bandwidth      = (known after apply)
      + relation_fv_rs_bd_to_ep_ret = (known after apply)
      + relation_fv_rs_bd_to_nd_p   = (known after apply)
      + relation_fv_rs_bd_to_out    = [
          + "uni/tn-common/ctx-default",
        ]
      + relation_fv_rs_ctx          = "uni/tn-common/ctx-default"
      + relation_fv_rs_igmpsn       = (known after apply)
      + relation_fv_rs_mldsn        = (known after apply)
      + tenant_dn                   = "uni/tn-common"
      + unicast_route               = (known after apply)
      + unk_mac_ucast_act           = "flood"
      + unk_mcast_act               = (known after apply)
      + v6unk_mcast_act             = (known after apply)
      + vmac                        = (known after apply)
    }

  # module.legacy_epg.aci_subnet.subnet[0] will be created
  + resource "aci_subnet" "subnet" {
      + annotation  = "orchestrator:terraform"
      + ctrl        = (known after apply)
      + description = "Legacy VLAN 200 - 10.1.200/24"
      + id          = (known after apply)
      + ip          = "10.1.200.1/24"
      + name_alias  = (known after apply)
      + parent_dn   = (known after apply)
      + preferred   = "yes"
      + scope       = [
          + "public",
        ]
      + virtual     = (known after apply)
    }

Plan: 4 to add, 0 to change, 0 to destroy.
module.legacy_epg.aci_application_profile.application[0]: Creating...
module.legacy_epg.aci_bridge_domain.bridge_domain: Creating...
module.legacy_epg.aci_application_profile.application[0]: Creation complete after 0s [id=uni/tn-common/ap-legacy_networks]
module.legacy_epg.aci_bridge_domain.bridge_domain: Creation complete after 1s [id=uni/tn-common/BD-legacy-200]
module.legacy_epg.aci_subnet.subnet[0]: Creating...
module.legacy_epg.aci_application_epg.epg: Creating...
module.legacy_epg.aci_subnet.subnet[0]: Creation complete after 4s [id=uni/tn-common/BD-legacy-200/subnet-[10.1.200.1/24]]
module.legacy_epg.aci_application_epg.epg: Creation complete after 5s [id=uni/tn-common/ap-legacy_networks/epg-legacy-200]

Apply complete! Resources: 4 added, 0 changed, 0 destroyed.
terraform-aci-legacy_epg(main) ▶ 
```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~>1.1.0 |
| <a name="requirement_aci"></a> [aci](#requirement\_aci) | ~>2.1.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_legacy_epg"></a> [legacy\_epg](#module\_legacy\_epg) | ./modules/legacy_epg | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
