web_admin_user:
    user.present:
        - name: "WebAdmin"
        - shell: /bin/bash
        - uid: 10091
        - home: /var/wwww/html

web_admin_key:
    ssh_auth.present:
        - name: "WebAdmin"
        - user: "WebAdmin"
        - source: salt://templates/userkeys/WebAdmin.pub
