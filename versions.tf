terraform {
  required_version = "~>1.1.0"
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = "~>2.1.0"
    }
  }
}