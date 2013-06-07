pkgs:
{% if grains['os_family'] == 'Debian' %}
    vim: vim
    python: python
    openssh: openssh-client
{% elif grains['os_family'] == 'RedHat' %}
    vim: vim-enhanced
    python: python
    openssh: openssh
{% elif grains['os'] == 'Arch' %}
    vim: vim
    python: python2
    openssh: openssh
{% else %}
    vim: vim
    python: python
    openssh: openssh
{% endif %}
