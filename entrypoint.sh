#!/bin/sh
set -e

: "${CONSUL_TLS_CERT:?missing}"
: "${CONSUL_TLS_KEY:?missing}"
: "${CONSUL_TLS_CA:?missing}"
: "${CONSUL_TOKEN:?missing}"

PORT="${PORT:-8501}"

mkdir -p /tmp/certs

echo "$CONSUL_TLS_CERT" | base64 -d > /tmp/certs/consul-server.pem
echo "$CONSUL_TLS_KEY"  | base64 -d > /tmp/certs/consul-server.key
echo "$CONSUL_TLS_CA"   | base64 -d > /tmp/certs/rootCA.pem

exec consul agent \
  -config-file=/etc/consul/consul.hcl \
  -client=0.0.0.0 \
  -hcl="ports { https = ${PORT} }" \
  -hcl="acl { tokens { initial_management = \"${CONSUL_TOKEN}\" agent = \"${CONSUL_TOKEN}\" default = \"${CONSUL_TOKEN}\" } }"

# #!/bin/sh
# set -e

# mkdir -p /tmp/certs

# echo "$CONSUL_TLS_CERT" | base64 -d > /tmp/certs/consul-server.pem
# echo "$CONSUL_TLS_KEY"  | base64 -d > /tmp/certs/consul-server.key
# echo "$CONSUL_TLS_CA"   | base64 -d > /tmp/certs/rootCA.pem

# exec consul agent \
#   -config-file=/etc/consul/consul.hcl \
#   -hcl="ports { https = ${PORT} }" \
#   -hcl="acl { tokens { initial_management = \"${CONSUL_TOKEN}\" agent = \"${CONSUL_TOKEN}\" default = \"${CONSUL_TOKEN}\" } }"

  

