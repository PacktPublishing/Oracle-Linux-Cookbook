packer {
  required_plugins {
    virtualbox = {
      source  = "github.com/hashicorp/virtualbox"
      version = "~> 1"
    }
    vagrant = {
      source  = "github.com/hashicorp/vagrant"
      version = "~> 1"
    }
  }
}

source "virtualbox-iso" "ol8u8" {
  guest_os_type    = "Oracle_64"
  iso_url          = "https://yum.oracle.com/ISOS/OracleLinux/OL8/u8/x86_64/x86_64-boot-uek.iso"
  iso_checksum     = "sha256:fd19b985ddd60175c36812c5a25b2126233132b399b5ee3351e13f64e5dbe7c5"
  ssh_username     = "root"
  ssh_password     = "vagrant"
  headless         = "true"
  ssh_wait_timeout = "30m"
  http_directory   = "http"
  nic_type         = "virtio"
  boot_command = [
    "<up><tab> inst.text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ol8-ks.cfg setup_swap=yes <enter>"
  ]
  vboxmanage = [
    ["modifyvm", "{{.Name}}", "--memory", "2048"],
    ["modifyvm", "{{.Name}}", "--cpus", "2"],
    ["modifyvm", "{{.Name}}", "--nat-localhostreachable1", "on"] # Fix for VirtualBox 7. Remove this line if using VirtualBox 6.
  ]
  shutdown_command = "shutdown -P now"
}

build {
  sources = ["sources.virtualbox-iso.ol8u8"]

  provisioner "shell" {
    script = "scripts/vagrant-base-box.sh"
  }

  post-processor "vagrant" {
    output = "ol8-x64-virtualbox.box"
  }
}