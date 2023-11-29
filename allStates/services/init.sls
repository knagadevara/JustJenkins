service_unit_{{ package_name }}:
    file.managed:
        - source: salt://templates/service_unit/genericService.jinja
        - user: root
        - group: root
        - mode: "0644"
        - template: jinja
        - name : /etc/systemd/system/{{ package_name }}
        - encoding: "UTF-8"
        - replace: True
        - create: True    