host_file:
    file.managed:
        - source: salt://templates/hosts.jinja
        - user: root
        - group: root
        - mode: "0644"
        - template: jinja
        - name : /etc/hosts
        - encoding: "UTF-8"
        - replace: True
        - create: True    