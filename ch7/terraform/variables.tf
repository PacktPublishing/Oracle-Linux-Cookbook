variable "tenancy_ocid" {
  description = "OCID of your tenancy"
  type        = string
}

variable "user_ocid" {
  description = "OCID of the user calling the API"
  type        = string
}

variable "fingerprint" {
  description = "Fingerprint for the key pair being used"
  type        = string
}

variable "private_key_path" {
  description = "The path to the private key file"
  type        = string
}

variable "region" {
  description = "An OCI region"
  type        = string
}

variable "subnet_ocid" {
  description = "The OCID of the subnet to create the VNIC in"
  type        = string
}

variable "instance_name" {
  description = "A user-friendly name. Does not have to be unique, and it's changeable."
  type        = string
  default     = "My first IaC instance"
}

variable "os_image_ocid" {
  description = "The OCID for the OS image."
  type        = string
  default     = "ocid1.image.oc1.iad.aaaaaaaa24ckjg36yh22ksnu7wuzozne6wnh5go4dsbycod244oguv42t6lq"
}

variable "vcn_ocid" {
  description = "The OCID for the Virtual Cloud Network."
  type        = string
}

variable "nsg_ocid" {
  description = "The OCID for the Network Security Group."
  type        = string
}