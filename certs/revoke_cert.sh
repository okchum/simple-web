#!/bin/bash -e

# Revoking a client certificate

openssl ca -revoke "${1}/${1}.crt"
openssl ca -gencrl -out "./demoCA/private/ca.crl"
