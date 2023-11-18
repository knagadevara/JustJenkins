server_message:
    file.managed:
        - source: salt://templates/motd.j2
        - user: root
        - group: root
        - mode: 0644
        - template: jinja
        - name : /etc/motd