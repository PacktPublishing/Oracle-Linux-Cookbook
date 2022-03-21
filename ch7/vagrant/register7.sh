yum repolist
yum install oraclelinux-release-el7 -y
/usr/bin/ol_yum_configure.sh
yum install oracle-linux-manager-client-release-el7 -y
yum install rhn-client-tools rhn-check rhn-setup rhnsd m2crypto yum-rhn-plugin -y
wget -q -O /usr/share/rhn/RHN-ORG-TRUSTED-SSL-CERT http://olmsvr_FQDN/pub/RHN-ORG-TRUSTED-SSL-CERT
yum install http://olmsvr_FQDN/pub/rhn-org-trusted-ssl-cert-1.0-1.noarch.rpm -y
rhnreg_ks --sslCACert=/usr/share/rhn/RHN-ORG-TRUSTED-SSL-CERT --serverUrl=https://olmsvr_FQDN/XMLRPC --activationkey=activation_key
yum remove oracle-linux-manager-client-release-el7 -y