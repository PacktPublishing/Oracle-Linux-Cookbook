# Packer `oracle-oci` Plugin Configuration

This is a quick reference to make it easier to find your OCID's required to configure the Packer oracle-oci plugin. For detailed information, refer to the official [OCI Documentation](https://docs.oracle.com/en-us/iaas/Content/API/SDKDocs/terraformproviderconfiguration.htm).

For each item, start from the [`OCI Console`](https://cloud.oracle.com).

- [tenancy_ocid](https://docs.oracle.com/en-us/iaas/Content/GSG/Tasks/contactingsupport_topic-Finding_Your_Tenancy_OCID_Oracle_Cloud_Identifier.htm): `Cloud Console` ➜ `Profile` ➜ [`Tenancy`](https://cloud.oracle.com/tenancy) ➜ `OCID`
- [compartment_ocid](https://docs.oracle.com/en-us/iaas/Content/GSG/Tasks/contactingsupport_topic-Finding_the_OCID_of_a_Compartment.htm): `Cloud Console` ➜ `Profile` ➜ `Identity` ➜ [`Compartments`](https://cloud.oracle.com/identity/compartments) ➜ *select your compartment* ➜ `OCID`
- user_ocid: `Cloud Console` ➜ `Profile` ➜ [`My Profile`](https://cloud.oracle.com/identity/domains/my-profile) ➜ `OCID`
- subnet_ocid: `Cloud Console` ➜ `Networking` ➜ [`VCN`](https://cloud.oracle.com/networking/vcns) ➜ *select your VCN* ➜ *select your subnet* ➜ `OCID`
- [availability_domain](https://docs.oracle.com/en-us/iaas/Content/General/Concepts/regions.htm#ad-names) ➜ You can see the names when you use the OCI Console to create an instance and choose which availability domain to create the instance in.
- [key_file](https://docs.oracle.com/en-us/iaas/Content/API/Concepts/apisigningkey.htm#two) - *Follow the instructions on the link to generate an API Signing Key.*
- [fingerprint](https://docs.oracle.com/en-us/iaas/Content/API/Concepts/apisigningkey.htm#three) - *Follow the instructions on the link to get the upload your Public Key to OCI and get the fingerprint.*

Plug your OCID's for each of these items into the [`variables.auto.pkrvars.hcl`](./variables.auto.pkrvars.hcl.sample) file.

Example:

```bash
tenancy_ocid        = "ocid1.tenancy.oc1..aaaaaaaa******"
compartment_ocid    = "ocid1.compartment.oc1..aaaaaaaa******"
user_ocid           = "ocid1.user.oc1..aaaaaaaa******"
subnet_ocid         = "ocid1.subnet.oc1.iad.aaaaaaaa******"
availability_domain = "xebt:US-ASHBURN-AD-3"
region              = "us-ashburn-1"
key_file            = "./.oci/oci_api_key.pem"
fingerprint         = "12:34:56:78:90:ab:cd:ef:12:34:56:78:90:ab:cd:ef"
```