# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import yed with context %}

include:
  - yed.config.clean

yed-package-jar-clean-file-absent:
  file.absent:
    - names:
      - {{ yed.pkg.jar.name }}
      - {{ yed.dir.jar }}
    - require:
      - sls: yed.config.clean
