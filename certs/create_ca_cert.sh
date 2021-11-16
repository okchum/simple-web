#!/bin/bash -e

# Creating CA
# Quiet mode
# Country
C="CN"
# State
ST="Shanghai"
# City
L="Shanghai"
# Company
O="Company"
# OU
OU="R&D"
# FQDN
CN="www.example.com"
# Email
emailAddress="admin@example.com"

mkdir -p ./demoCA/{private,newcerts}
touch ./demoCA/index.txt
[ ! -f ./demoCA/seria ] && echo 01 > ./demoCA/serial
[ ! -f ./demoCA/crlnumber ] && echo 01 > ./demoCA/crlnumber
[ ! -f ./demoCA/cacert.pem ] && openssl req -utf8 -new -x509 -days 36500 -newkey rsa:2048 -nodes -keyout ./demoCA/private/cakey.pem -out ./demoCA/cacert.pem -subj "/C=${C}/ST=${ST}/L=${L}/O=${O}/OU=${OU}/CN=${CN}/emailAddress=${emailAddress}"
[ ! -f ./demoCA/private/ca.crl ] && openssl ca -crldays 36500 -gencrl -out "./demoCA/private/ca.crl"
