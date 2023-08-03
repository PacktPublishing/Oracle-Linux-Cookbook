#!/bin/bash

########################################
# create the first spacewalk account

LANG=C

USERNAME=admin
PASSWORD=Password1
FIRSTNAME=Administrator
LASTNAME=Spacewalk
ORGINIZATION=Oracle
EMAIL=root%40localhost

tempfile=$(mktemp /tmp/$(basename $0).XXXXXX)

trap cleanup EXIT

cleanup() {
  exitcode=$?
  test -f "$tempfile" && rm -f "$tempfile"
  exit $exitcode
}

if [ "$(satwho | wc -l)" = "0" ]; then
  curl --silent https://localhost/rhn/newlogin/CreateFirstUser.do --insecure -D - >$tempfile

  cookie=$(egrep -o 'JSESSIONID=[^ ]+' $tempfile)
  csrf=$(egrep csrf_token $tempfile | egrep -o 'value=[^ ]+' | egrep -o '[0-9]+')

    curl --noproxy '*' \
      --cookie "$cookie" \
      --insecure \
      --data "csrf_token=-${csrf}&submitted=true&orgName=${ORGINIZATION}&login=${USERNAME}&desiredpassword=${PASSWORD}&desiredpasswordConfirm=${PASSWORD}&email=${EMAIL}&firstNames=${FIRSTNAME}&lastName=${LASTNAME}&" \
      https://localhost/rhn/newlogin/CreateFirstUser.do


  if [ "$(satwho | wc -l)" = "0" ]; then
    echo "Error: user creation failed" >&2
  fi
else
  echo "Error: There is already a user. No user created." >&2
  exit 1
fi