FROM hashicorp/consul:1.22

COPY entrypoint.sh /entrypoint.sh
COPY consul.hcl /etc/consul/consul.hcl

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]