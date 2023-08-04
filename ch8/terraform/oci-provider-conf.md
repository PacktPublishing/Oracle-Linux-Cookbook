# OCI Provider Configuration

This is a quick reference to make it easier to find your OCID's required to configure the Terraform OCI provider. For detailed information, refer to the official [OCI Documentation](https://docs.oracle.com/en-us/iaas/Content/API/SDKDocs/terraformproviderconfiguration.htm).

For each item, start from the [`OCI Console`](https://cloud.oracle.com).

- [tenancy_ocid](https://docs.oracle.com/en-us/iaas/Content/GSG/Tasks/contactingsupport_topic-Finding_Your_Tenancy_OCID_Oracle_Cloud_Identifier.htm): `Cloud Console` ➜ `Profile` ➜ [`Tenancy`](https://cloud.oracle.com/tenancy) ➜ `OCID`
- [compartment_ocid](https://docs.oracle.com/en-us/iaas/Content/GSG/Tasks/contactingsupport_topic-Finding_the_OCID_of_a_Compartment.htm): `Cloud Console` ➜ `Profile` ➜ `Identity` ➜ [`Compartments`](https://cloud.oracle.com/identity/compartments) ➜ *select your compartment* ➜ `OCID`
- user_ocid: `Cloud Console` ➜ `Profile` ➜ [`My Profile`](https://cloud.oracle.com/identity/domains/my-profile) ➜ `OCID`
- vcn_ocid: `Cloud Console` ➜ `Networking` ➜ [`VCN`](https://cloud.oracle.com/networking/vcns) ➜ *select your VCN* ➜ `OCID`
- subnet_ocid: `Cloud Console` ➜ `Networking` ➜ [`VCN`](https://cloud.oracle.com/networking/vcns) ➜ *select your VCN* ➜ `OCID` ➜ *select your subnet* ➜ `OCID`
- [private_key_path](https://docs.oracle.com/en-us/iaas/Content/API/Concepts/apisigningkey.htm#two) - *Follow the instructions on the link to generate an API Signing Key.*
- [fingerprint](https://docs.oracle.com/en-us/iaas/Content/API/Concepts/apisigningkey.htm#three) - *Follow the instructions on the link to get the upload your Public Key to OCI and get the fingerprint.*

Plug your OCID's for each of these items into the [`terraform.tfvars`](./terraform.tfvars.sample) file.

Example:

```bash
instance_name    = "INSERT_DESIRED_ENVIRONMENT_NAME"
region           = "us-ashburn-1"
tenancy_ocid     = "ocid1.tenancy.oc1..aaaaaaaa******"
compartment_ocid = "ocid1.compartment.oc1..aaaaaaaa******"
user_ocid        = "ocid1.user.oc1..aaaaaaaa******"
vcn_ocid         = "ocid1.vcn.oc1.iad.amaaaaaa******"
subnet_ocid      = "ocid1.subnet.oc1.iad.aaaaaaaa******"
os_image_ocid    = "ocid1.image.oc1.iad.aaaaaaaasdqmcux7p5sdhhsqygmfzf2n6smemihykfv4bv7qh4235zre75da"
private_key_path = "./.oci/oci_api_key.pem"
fingerprint      = "12:34:56:78:90:ab:cd:ef:12:34:56:78:90:ab:cd:ef"
```