ssh:
    pkg.installed:
        - name: {{ pillar['pkgs']['openssh'] }}

ssh_private_key:
    file.managed:
        - name: {{ pillar['core']['home'] }}/.ssh/id_rsa
        - source: salt://ssh/id_rsa
        - user: {{ pillar['core']['user'] }}
        - group: {{ pillar['core']['user'] }}
        - mode: 400
        - require:
            - pkg: ssh

ssh_public_key:
    file.managed:
        - name: {{ pillar['core']['home'] }}/.ssh/id_rsa.pub
        - source: salt://ssh/id_rsa.pub
        - user: {{ pillar['core']['user'] }}
        - group: {{ pillar['core']['user'] }}
        - mode: 400
        - require:
            - pkg: ssh
