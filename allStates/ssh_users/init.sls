{% set node_role =   salt['grains.get']('role') %}
{% set admin_user =   [ {{ node_role }} , "_" ,"ssh_user" ] | join %}
{% set admin_group =   [ {{ node_role }} , "_" ,"ssh_group" ] | join %}
{% for user, user_attributes in salt['pillar.get']( node_role ).items() %}

{{ user }}_group:
  group.present:
    - name: {{ admin_group.name }}
    - system: {{ admin_group.system }}
    - addusers: {{ user }}

{{ user }}:
  user.present:
    - fullname: {{ user_attributes.full_name }}
    - home: /home/{{ user }}
    - shell: {{ user_attributes.shell }}
    - uid: {{ user_attributes.uid }}
    - gid_from_name: True

web_admin_key_{{ user }}:
    ssh_auth.manage:
        - name: {{ user }}_key.pub
        - user: {{ user }}
        - comment: "Key for {{ user_attributes.full_name }} "
        - ssh_keys:
            - {{ user_attributes.ssh_key }}

{% endfor %}