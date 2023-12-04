{%- set kcore_pth =  [ salt['pillar.get']("kube_dl_pth"),
salt['pillar.get']("kube_version"),
"/bin/linux/" , salt['pillar.get']("sys_arch"), "/" ] | join -%}
{%- set dl_pth =  salt['pillar.get']("k8s_path").binary -%}
{%- for package_name,package_val in salt['pillar.get']("master").items() %}
download_{{ package_name }}:
  file.managed:
    - name: {{ [ dl_pth , package_name ] | join }}
    - source:   {{ [ kcore_pth , package_name ] | join }}
    - user: root
    - group: root
    - mode: "0775"
    - source_hash: {{ package_val.hash }}
{%- endfor -%}