{{ pillar['core']['home'] }}/.ssh/id_rsa:
    file.managed:
        - source: salt://ssh/id_rsa
        - user: {{ pillar['core']['user'] }}
        - mode: 400

{{ pillar['core']['home'] }}/.ssh/id_rsa.pub:
    file.managed:
        - source: salt://ssh/id_rsa.pub
        - user: {{ pillar['core']['user'] }}
        - mode: 400

openssh:
    pkg:
        - installed
