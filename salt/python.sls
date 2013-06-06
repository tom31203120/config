python:
    pkg:
        - installed
        - name: {{ pillar['pkgs']['python'] }}

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
