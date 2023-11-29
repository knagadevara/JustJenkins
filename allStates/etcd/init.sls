{% set github_url = salt["pillar.get"]("github_url") %}
{% set dl_pth =  salt['pillar.get']("dl_path") %}
{% set attr = salt["pillar.get"]("ketcd") %}

download_{{ attr.name }}:
  archive.extracted:
    - name: {{ dl_pth }}
    - source: {{ [github_url ,attr.source]| join }}
    - source_hash: {{ attr.hash }}
    - archive_format: tar

copy_{{ attr.name }}:
  file.copy:
    - name: {{ [ dl_pth , "etcd" ] | join }}
    - source: {{ [ dl_pth , attr.name , "/etcd" ] | join }}

delete_{{ attr.name }}:
  file.absent:
    - name: {{ [ dl_pth , attr.name ] | join }}
    - require:
      - file: {{ [ dl_pth ,  "etcd" ] | join }}