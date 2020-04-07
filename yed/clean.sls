# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import yed with context %}
{%- set p = yed.pkg %}

include:
             {%- if yed.pkg.use_upstream_package or grains.os_family in ('MacOS',) %}
  - .package.clean
             {%- elif yed.pkg.use_upstream_jar  %}
  - .jar.clean
             {%- endif %}
