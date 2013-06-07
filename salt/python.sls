python:
    pkg:
        - installed
        - names:
            -  {{ pillar['pkgs']['python'] }}
{% if grains['os_family'] != 'Arch'  %}
            - python-dev
{% endif %}

python-pkgs:
    pkg:
        - installed
        - names:
            - python-pip
            - python-imaging
        - require:
            - pkg: python

pip-pkgs:
    pip.installed:
        - names:
            - pylint
            - ipython
            - ipdb
            - tornado
            - virtualenvwrapper
        - require:
            - pkg: python-pkgs

gevent:
    pip.installed:
        - require:
            - pkg: libevent-dev
            - pkg: gcc

distribute:
    pip.installed:
        - upgrade: True

MySQL-python:
    pip.installed:
        - require:
            - pkg: libmysqlclient-dev
            - pip.installed: distribute
