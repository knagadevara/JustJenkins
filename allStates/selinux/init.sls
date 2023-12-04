/etc/selinux/config:
  file.managed:
    - source: salt://templates/service_unit/etcd.jinja
    - user: root
    - group: root
    - mode: "0644"
    - template: jinja
    - encoding: "UTF-8"
    - replace: True
    - create: True