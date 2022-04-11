output "subnet" {
  value       = concat(aci_subnet.subnet.*, [""])[0]
  description = "Output of the resource block for the Subnet that has been created"
}

output "epg" {
  value       = concat(aci_application_epg.epg.*, [""])[0]
  description = "Output of the resource block for the Endpoint Group that has been created"
}

output "application_profile" {
  value       = concat(aci_application_profile.application.*, [""])[0]
  description = "Output of the resource block for the Application Profile that has been created"
}

output "existing_application_profile" {
  value       = concat(data.aci_application_profile.application.*, [""])[0]
  description = "Output of the data block from the existing Tenant (if specified)"
}