# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import yed with context %}
{%- from tplroot ~ "/libtofs.jinja" import files_switch with context %}

include:
  - yed.jar

yed-config-file-managed-script_file:
  file.managed:
    - name: {{ yed.dir.jar }}/yed.sh
    - source: {{ files_switch(['script.sh.jinja'],
                              lookup='yed-config-file-managed-script_file'
                 )
              }}
    - mode: 640
    - user: {{ yed.rootuser }}
    - group: {{ yed.rootgroup }}
    - makedirs: True
    - template: jinja
    - context:
        path: {{ yed.config.path|json }}
    - require:
      - sls: yed.jar

    {%- endif %}
