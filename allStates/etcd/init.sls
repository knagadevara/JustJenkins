{% set github_url = salt["pillar.get"]("github_url") %}
{% set ketcd = salt["pillar.get"]("ketcd") %}
{% set k8s_path =  salt['pillar.get']("k8s_path") %}

create_{{ ketcd.bin_name }}:
  file.directory:
    - name: {{ [ k8s_path.lib , ketcd.bin_name] | join }}
    - user: root
    - group: root
    - mode: "0700"
    - recurse:
      - user
      - group
      - mode

download_{{ ketcd.name }}:
  archive.extracted:
    - name: {{ k8s_path.lib }}
    - source: {{ [ github_url ,ketcd.source ]| join }}
    - source_hash: {{ ketcd.hash }}
    - archive_format: tar

copy_{{ ketcd.name }}:
  file.copy:
    - name: {{ [ k8s_path.binary  , "etcd" ] | join }}
    - source: {{ [ k8s_path.lib , "/" , ketcd.name ,"/etcd" ] | join }}

service_file:
  file.managed:
    - source: salt://templates/service_unit/etcd.jinja
    - user: root
    - group: root
    - mode: "0600"
    - template: jinja
    - name : {{ [ k8s_path.service , ketcd.bin_name  , ".service"] | join }}
    - encoding: "UTF-8"
    - replace: True
    - create: True

delete_{{ ketcd.name }}:
  file.absent:
    - name: {{ [ k8s_path.lib , ketcd.name ] | join }}
    - require:
      - file: {{ [ k8s_path.lib ,  "etcd" ] | join }}

create_symlink:
  file.symlink:
    - name: {{ [ k8s_path.sys_unit , ketcd.bin_name  , ".service" ] | join }}
    - target : {{ [ k8s_path.service , ketcd.bin_name  , ".service" ] | join }}
    - force: True
    - user: root
    - group: root

do_daemon_reload:
  cmd.run:
    - name: systemctl daemon-reload
    - require:
      - file: {{ [ k8s_path.sys_unit , ketcd.bin_name  , ".service" ] | join }}

reload_configuration:
  service.running:
    - name: {{ [ketcd.bin_name  , ".service" ] | join  }}
    - enable: True
    - sig: "etcd"
    