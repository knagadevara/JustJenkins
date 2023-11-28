{% set pkg_dtls = salt["pillar.get"]("ketcd") %}
download_{{ pkg_dtls }}:
  archive.extracted:
    - name: {{ pkg_dtls }}.name
    - source: {{ pkg_dtls }}.source
    - source_hash: {{ pkg_dtls }}.hash
