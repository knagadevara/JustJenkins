{% set kcore_pth =  [ salt['pillar.get']("kube_dl_pth")  , salt['pillar.get']("kube_version") , "/bin/linux/" , salt['pillar.get']("sys_arch") , "/" ] | join %}
{% for package_name,package_val in salt['pillar.get']("master").items() %}

download_{{ package_name }}:
  archive.extracted:
    - name: {{ package_name }}
    - source:   {{ [ kcore_pth , package_name ] | join }}
    - source_hash: {{ package_val.hash }}

{% endfor %}