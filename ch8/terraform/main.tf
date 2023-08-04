terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "5.7.0"
    }
  }
}

provider "oci" {
  # API Key Authentication
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}

# Generate SSH Key Pair for access
resource "tls_private_key" "ssh" {
  algorithm = "RSA"
}
resource "local_sensitive_file" "ssh_private_key" {
  filename          = "${path.module}/instances/${var.instance_name}/id_rsa"
  file_permission   = "600"
  content = tls_private_key.ssh.private_key_pem
}

# Get a list of Availability Domains
data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_ocid
}

# Create an OCI core instance
resource "oci_core_instance" "ol_instance" {
  depends_on = [
    tls_private_key.ssh
  ]
  display_name        = var.instance_name
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[2].name
  compartment_id      = var.compartment_ocid
  shape               = "VM.Standard.E2.1.Micro"

  source_details {
    source_id   = var.os_image_ocid
    source_type = "image"
  }
  create_vnic_details {
    assign_public_ip = true
    subnet_id        = var.subnet_ocid
  }
  metadata = {
    ssh_authorized_keys = tls_private_key.ssh.public_key_openssh
  }
}

output "connection_details" {
  value       = format("ssh -i ./instances/${var.instance_name}/id_rsa opc@%s", oci_core_instance.ol_instance.public_ip)
  description = "Details how to connect using the public IP address of the instance."
}

resource "local_file" "readme" {
  filename = "${path.module}/instances/${var.instance_name}/README.md"
  content  = oci_core_instance.ol_instance.public_ip
}
