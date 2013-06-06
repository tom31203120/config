include:
    - core

myenv-pkgs:
    pkg:
        - installed
        - names:
            - curl
            - wget
            - tmux 
            - ctags
{% if grains['os'] != 'Debian' %}
            - ack
{% else %}
            - ack-grep
{% endif %}
        - require:
            - pkg: vim
            - pkg: nodejs

oh_my_zsh:
    git.latest:
        - runas: {{ pillar['core']['user'] }}
        - rev: master
        - target: {{ pillar['core']['home'] }}/.oh-my-zsh
        - name: git@github.com:robbyrussell/oh-my-zsh.git
        - require:
            - file.directory: proj_directory
    cmd.run:
        - user: {{ pillar['core']['user'] }}
        - name: "cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc"
        - require:
            - git.latest: oh_my_zsh

proj_directory:
    file.directory:
        - user: {{ pillar['core']['user'] }}
        - makedirs: True
        - name: {{ pillar['core']['home'] }}/proj/

config_repo:
    git.latest:
        - runas: {{ pillar['core']['user'] }}
        - rev: master
        - target: {{ pillar['core']['home'] }}/proj/config
        - name: git@github.com:apieceofredcloth/config.git
        - require:
            - file.directory: proj_directory

vim_vundle_repo:
    git.latest:
        - runas: {{ pillar['core']['user'] }}
        - rev: master
        - target: {{ pillar['core']['home'] }}/.vim/bundle/vundle
        - name: git@github.com:gmarik/vundle.git
        - require:
            - pkg: vim

{% for config_file in ['.gitconfig', '.jshintrc', '.pylintrc', '.tmux.conf', '.vimrc'] %}
{{ pillar['core']['home'] }}/{{config_file}}:
    file.symlink:
        - user: {{ pillar['core']['user'] }}
        - target: {{ pillar['core']['home'] }}/proj/config/{{config_file}}
        - require:
            - git: config_repo
            - pkg: vim
            - pkg: tmux
            - npm.installed: npm-pkgs 
            - pip.installed: pip-pkgs
{% endfor %}
