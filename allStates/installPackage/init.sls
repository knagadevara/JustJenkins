{% set osfamily = salt['grains.get']('os_family')  %}
{% set osfamily_root = [ osfamily , "."  , "default_packages" ] | join %}
{% set allow_updates = [ osfamily , "."  , "allow_updates" ] | join %}
tar:
  pkg.installed:
    - refresh: true
    - pkg_verify: true

{% set allow_updates = salt['pillar.get']( osfamily_root) %}
{% for distro_type, package_name in salt['pillar.get'](osfamily_root) %}

{{ distro_type }}_repo:
  pkgrepo.installed:
    - name: {{ package_name.name }}
    - version: {{ package_name.version }}
    - fromrepo: {{ package_name.reponame }}
    - allow_updates: {{ allow_updates }}

{% endfor %}