{% set default_packages = [ salt['grains.get']('role') , "." , salt['grains.get']('os_family') ] | join %}
{% for distro_name,distro_attr in salt['pillar.get']().items() %}

{{ distro_name }}_repo:
  pkgrepo.managed:
    - name: {{ distro_attr.name }}
    - dist: {{ distro_name }}
    - file: {{ distro_attr.repofile }}
    - keyid: {{ distro_attr.keyid }}
    - keyserver: {{ distro_attr.keyserver }}
    - refresh_db: true

{% endfor %}