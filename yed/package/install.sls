# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import yed with context %}

yed-package-install-cmd-run-brew:
  cmd.run:
    - name: brew cask install {{ yed.pkg.name }}
    - runas: {{ yed.rootuser }}
    - onlyif:
      - test -x /usr/local/bin/brew
      - {{ grains.os == 'MacOS' }}
