{%- set netdetails = salt['pillar.get']('network_details') -%}

add_routes:
  network.routes:
    - name: enp0s1
    - routes:
      - name: secure_network
        ipaddr: {{ netdetails.net_addr.pool_addr }}
        netmask: {{ netdetails.net_addr.mask }}
        gateway: {{ netdetails.net_addr.gateway }}

# system:
#   network.system:
#     - enabled: True
#     - hostname: server1.example.com
#     - gateway: 192.168.0.1
#     - gatewaydev: eth0
#     - nozeroconf: True
#     - nisdomain: example.com
#     - require_reboot: True
#     - apply_hostname: True