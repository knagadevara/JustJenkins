## This Salt state file will install Apache

install_apache:
    pkg.installed:
        - install_recommends: True
        - pkgs:
            - apache2

start_apache:
    service.running:
        - name: apache2
        - enable: True

apache_message:
    file.managed:
        - source: salt://templates/index.html.j2
        - user: www-data
        - group: www-data
        - mode: 0644
        - template: jinja
        - name : /var/www/html/index.html

