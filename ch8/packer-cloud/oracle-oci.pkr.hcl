packer {
  required_plugins {
    oracle-oci = {
      version = ">= 1.0.5"
      source  = "github.com/hashicorp/oracle"
    }
  }
}

locals {
  timestamp = "${formatdate("YYYYMMDDhhmmss", timestamp())}"
}

source "oracle-oci" "ol8u8" {
  tenancy_ocid        = "${var.tenancy_ocid}"
  compartment_ocid    = "${var.compartment_ocid}"
  user_ocid           = "${var.user_ocid}"
  fingerprint         = "${var.fingerprint}"
  key_file            = "${var.key_file}"
  subnet_ocid         = "${var.subnet_ocid}"
  availability_domain = "${var.availability_domain}"
  region              = "${var.region}"
  instance_name       = "packer-build-${local.timestamp}"
  base_image_ocid     = "ocid1.image.oc1.iad.aaaaaaaazi34xyxv6og7qgn3nqvaykfvg5ntkkx7yhlkjzpn4z45l72l53wa"
  image_name          = "Oracle Linux 8.8"
  shape               = "VM.Standard.E4.Flex"
  shape_config {
    ocpus         = 2
    memory_in_gbs = 4
  }
  ssh_username = "opc"
}

build {
  name    = "Oracle Linux 8.8 with Git"
  sources = ["source.oracle-oci.ol8u8"]
  provisioner "shell" {
    inline = ["sudo dnf install -y git"]
  }
}