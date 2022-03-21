source "oracle-oci" "8u5" {
  availability_domain = "hVkW:US-ASHBURN-AD-3"
  base_image_ocid     = "ocid1.image.oc1.iad.aaaaaaaa24ckjg36yh22ksnu7wuzozne6wnh5go4dsbycod244oguv42t6lq"
  image_name          = "Oracle Linux 8.5"
  shape               = "VM.Standard.E2.1.Micro"
  ssh_username        = "opc"
  subnet_ocid         = "ocid1.subnet.oc1.iad.aaaaaaaacqv3geh3a4dnvqrazm3zgxwsc2ld3orimz25h72sstjmgjzyr5sa"
}

build {
  name    = "Oracle Linux 8.5 with Git"
  sources = ["source.oracle-oci.8u5"]
  provisioner "shell" {
    inline = ["sudo dnf install -y git"]
  }
}