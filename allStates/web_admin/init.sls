{% set node_role =   [ salt['grains.get']('role')  , "_" ,"ssh_user" ] | join %}
{% for user, user_attributes in salt['pillar.get']( node_role ).items() %}

{{ user }}_group:
  group.present:
    - gid: {{ user_attributes.uid }}
    - non_unique: True

{{ user }}:
  user.present:
    - fullname: {{ user_attributes.full_name }}
    - home: /home/{{ user }}
    - shell: {{ user_attributes.shell }}
    - uid: {{ user_attributes.uid }}
    - gid: {{ user_attributes.uid }}

web_admin_key_{{ user }}:
    ssh_auth.manage:
        - name: {{ user }}_key.pub
        - user: {{ user }}
        - comment: "Key for {{ user_attributes.full_name }} "
        - ssh_keys:
            - {{ user_attributes.ssh_key }}

{% endfor %}