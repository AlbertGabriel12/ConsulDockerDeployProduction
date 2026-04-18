#!/bin/sh
set -e

mkdir -p /tmp/certs

echo "$CONSUL_TLS_CERT" | base64 -d > /tmp/certs/consul-server.pem
echo "$CONSUL_TLS_KEY"  | base64 -d > /tmp/certs/consul-server.key
echo "$CONSUL_TLS_CA"   | base64 -d > /tmp/certs/rootCA.pem

exec consul agent \
  -config-file=/etc/consul/consul.hcl \
  -hcl="ports { https = ${PORT} }" \
  -hcl="acl { tokens { initial_management = \"${CONSUL_TOKEN}\" } }"