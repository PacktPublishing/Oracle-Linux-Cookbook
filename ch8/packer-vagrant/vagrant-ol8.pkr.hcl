packer {
  required_plugins {
    virtualbox = {
      version = ">= 0.0.1"
      source  = "github.com/hashicorp/virtualbox"
    }
  }
}

source "virtualbox-iso" "ol8u5" {
  guest_os_type    = "Oracle_64"
  iso_url          = "https://yum.oracle.com/ISOS/OracleLinux/OL8/u5/x86_64/OracleLinux-R8-U5-x86_64-dvd.iso"
  iso_checksum     = "sha256:45939e85542c19dd519aaad7c4dbe84a6fcadfaca348245f92ae4472fc7f50ac"
  ssh_username     = "root"
  ssh_password     = "vagrant"
  headless         = "true"
  ssh_wait_timeout = "30m"
  http_directory   = "http"
  boot_command = [
    "<up><tab> inst.text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ol8-ks.cfg setup_swap=yes <enter>"
  ]
  vboxmanage = [
    ["modifyvm", "{{.Name}}", "--memory", "2048"],
    ["modifyvm", "{{.Name}}", "--cpus", "2"],
  ]
  shutdown_command = "shutdown -P now"
}

build {
  sources = ["sources.virtualbox-iso.ol8u5"]

  provisioner "shell" {
    script = "scripts/vagrant-base-box.sh"
  }

  post-processor "vagrant" {
    output = "ol8-x64-virtualbox.box"
  }
}