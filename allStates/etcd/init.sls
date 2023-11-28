{% pkg_dtls = salt["pillar.get"](etcd) %}
download_{{ pkg_dtls.name }}:
  archive.extracted:
    - name: {{ pkg_dtls.name }}
    - source: {{ pkg_dtls.source }}
    - source_hash: {{ pkg_dtls.hash }}
