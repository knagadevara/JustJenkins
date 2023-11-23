{% set osfamily_root = [ salt['grains.get']('role') , "." , salt['grains.get']('os_family') ] | join %}

vim:
  pkg.installed:
    - refresh: true
    - pkg_verify: true

{% set allow_updates = salt['pillar.get'](osfamily_root.allow_updates) %}
{% for distro_type, package_name in salt['pillar.get'](osfamily_root).items() %}

{{ distro_type }}_repo:
  pkgrepo.installed:
    - name: {{ package_name.name }}
    - version: {{ package_name.version }}
    - fromrepo: {{ package_name.reponame }}
    - allow_updates: {{ allow_updates }} 

{% endfor %}