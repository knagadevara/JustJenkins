{% set common_hash =  salt['pillar.get']("common").values() %}
{% set kcore_pth =  salt['pillar.get']("kube_core_path") %}

{% for package_name in common_hash %}

download_{{ package_name }}:
  archive.extracted:
    - name: {{ package_name }}
    - source:   {{ [ kcore_pth , package_name ] | join }}
    - source_hash: {{ package_name.hash }}

{% endfor %}