variable "tenancy_ocid" {
  type        = string
  description = "OCID of your tenancy"
}
variable "compartment_ocid" {
  type        = string
  description = "The OCID for your compartment"
}
variable "user_ocid" {
  type        = string
  description = "OCID of the user calling the API"
}
variable "subnet_ocid" {
  type        = string
  description = "The OCID of the subnet to create the VNIC in"
}
variable "availability_domain" {
  type        = string
  description = "The tenancy-specific prefix and availability domain. Example: Xebt:US-ASHBURN-AD-3"
}
variable "region" {
  type        = string
  description = "An OCI region"

}
variable "fingerprint" {
  type        = string
  description = "Fingerprint for the key pair being used"
}
variable "key_file" {
  type        = string
  description = "The path to the private key file"
}