# Boot ISO Variant

This is just a variant of the primary recipe. Instead of using the full ISO to install Oracle Linux, we're using the UEK boot ISO (this saves us from downloading 10+ GB).

1. Replace the ISO and checksum with the values to match the UEK boot ISO.

    **Filename:** vagrant-ol8.pkr.hcl

    ```bash
    ...
    ...
    ...
    source "virtualbox-iso" "ol8u8" {
      guest_os_type    = "Oracle_64"
      iso_url          = "https://yum.oracle.com/ISOS/OracleLinux/OL8/u8/x86_64/x86_64-boot-uek.iso"
      iso_checksum     = "sha256:fd19b985ddd60175c36812c5a25b2126233132b399b5ee3351e13f64e5dbe7c5"
      ...
      ...
      ...
    }
    ```

2. Then, in the kickstart, we simply add in the URL for the required repos and the latest Oracle Linux 8 base OS channel.

    **Filename:** ol8-ks.cfg

    ```bash
    ...
    ...
    ...
    # Additional yum repositories that may be used as sources for package installation.
    repo --name="ol8_AppStream" --baseurl="https://yum.oracle.com/repo/OracleLinux/OL8/appstream/x86_64/"
    repo --name="ol8_UEKR7" --baseurl="https://yum.oracle.com/repo/OracleLinux/OL8/UEKR7/x86_64/"
    url --url="https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64"

    # Root password
    rootpw --plaintext vagrant
    ...
    ...
    ...
    ```

3. Leave everything else the same and run `packer build`. When Packer is finished, you're left with a fully up-to-date Oracle Linux 8 Vagrant box.