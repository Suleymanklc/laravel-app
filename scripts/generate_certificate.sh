#!/bin/bash

DOMAIN="laravel.myhost.com"
CERT_DIR="./certs"
KEY_FILE="${CERT_DIR}/${DOMAIN}.key"
CERT_FILE="${CERT_DIR}/${DOMAIN}.crt"

mkdir -p ${CERT_DIR}

openssl genrsa -out ${KEY_FILE} 2048

openssl req -new -x509 -key ${KEY_FILE} -out ${CERT_FILE} -days 365 -subj "/CN=${DOMAIN}"
