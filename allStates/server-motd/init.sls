server_message:
    file.managed:
        - source: salt://templates/motd.jinja
        - user: root
        - group: root
        - mode: "0644"
        - template: jinja
        - name : /etc/motd
        - encoding: "UTF-8"
        - replace: True
        - create: True