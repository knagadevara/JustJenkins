{% set dl_pth =  salt['pillar.get']("k8s_path") %}
{% for name, path in dl_pth.items() %}
create_{{ path }}:
  file.directory:
    - name: {{ path }}
    - user: root
    - group: root
    - mode: "0755"
    - recurse:
      - user
      - group
{% endfor %}