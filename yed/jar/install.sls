# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import yed with context %}
{%- from tplroot ~ "/files/macros.jinja" import format_kwargs with context %}

include:
  - yed.config.script

yed-package-jar-install-extract:
  pkg.installed:
    - name: zip
  file.directory:
    - name: {{ yed.pkg.jar.name }}
    - user: {{ yed.rootuser }}
    - group: {{ yed.rootgroup }}
    - mode: 755
    - makedirs: True
    - require_in:
      - jar: yed-package-jar-install-extract
    - recurse:
        - user
        - group
        - mode
  archive.extracted:
    {{- format_kwargs(yed.pkg.jar) }}
    - jar_format: {{ yed.pkg.format }}
    - retry: {{ yed.retry_option }}
    - user: {{ yed.rootuser }}
    - group: {{ yed.rootgroup }}
    - require:
      - sls: yed.config.script
