data_dir = "/consul/data"
client_addr = "0.0.0.0"

ports {
  http  = -1
}

verify_incoming = true
verify_outgoing = true

ca_file   = "/tmp/certs/rootCA.pem"
cert_file = "/tmp/certs/consul-server.pem"
key_file  = "/tmp/certs/consul-server.key"
