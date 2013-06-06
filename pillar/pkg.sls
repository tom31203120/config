pkgs:
{% if grains['os_family'] == 'Debian' %}
    vim: vim
    python: python
{% elif grains['os_family'] == 'RedHat' %}
    vim: vim-enhanced
    python: python
{% elif grains['os'] == 'Arch' %}
    vim: vim
    python: python2
{% endif %}
