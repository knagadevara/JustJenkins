{# This Salt state file will install Apache #}
{% set pkgnm = salt['pillar.get'](salt['grains.get']('os_family')).name %}

install_{{ pkgnm }}:
    pkg.installed:
        - install_recommends: True
        - pkgs:
            - {{ pkgnm }}

start_{{ pkgnm }}:
    service.running:
        - name: {{ pkgnm }}
        - enable: True

message_for_{{ pkgnm }}_server:
    file.managed:
        - source: salt://templates/index.html.jinja
        - user: www-data
        - group: www-data
        - mode: "0644"
        - template: jinja
        - name : /var/www/html/index.html

