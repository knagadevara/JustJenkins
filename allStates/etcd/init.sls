{% set attr = salt["pillar.get"]("ketcd") %}
download_{{ attr.name }}:
  archive.extracted:
    - name: {{ attr.name }}
    - source: {{ attr.source }}
    - source_hash: {{ attr.hash }}
