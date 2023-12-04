{% set dname = salt['pillar.get']('network_details') %}

/etc/hosts:
  file.managed:
    - source: salt://templates/hosts.jinja
    - user: root
    - group: root
    - mode: "0644"
    - template: jinja
    - encoding: "UTF-8"
    - replace: True
    - create: True

/etc/sysconfig/network:
  file.managed:
    - content: {{ [ "DOMAINNAME = " , dname.domain_name ]| join }}
    - encoding: "UTF-8"
    - replace: True
    - create: True
    - user: root
    - group: root
    - mode: "0644"

/etc/sysctl.d/101-hostname.conf:
  file.managed:
    - content: {{ [ "kernel.domainname = " , dname.domain_name ] | join }}
    - encoding: "UTF-8"
    - replace: True
    - create: True
    - user: root
    - group: root
    - mode: "0644"
