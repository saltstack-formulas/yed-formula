# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import yed with context %}

include:
             {%- if yed.pkg.use_upstream_package or grains.os_family in ('MacOS',) %}
  - .package
             {%- elif yed.pkg.use_upstream_jar  %}
  - .jar
  - .config
             {%- endif %}
