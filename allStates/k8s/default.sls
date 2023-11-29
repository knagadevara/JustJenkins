{% set dl_pth =  salt['pillar.get']("dl_path") %}

create_{{ dl_pth }}:
  file.directory:
    - name: {{ dl_pth }}
    - user: root
    - group: root
    - mode: 755
    - recurse:
      - user
      - group
      - mode