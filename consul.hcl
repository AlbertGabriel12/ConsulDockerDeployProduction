data_dir    = "/consul/data"
client_addr = "0.0.0.0"
server      = true
bootstrap_expect = 1        # cluster de 1 nó só (single server)

ports {
  http = -1
}

tls {
  defaults {
    ca_file         = "/tmp/certs/rootCA.pem"
    cert_file       = "/tmp/certs/consul-server.pem"
    key_file        = "/tmp/certs/consul-server.key"
    verify_incoming = true
    verify_outgoing = true
  }
}

acl {
  enabled                  = true
  default_policy           = "deny"
  enable_token_persistence = true
}