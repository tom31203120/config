nodejs:
    pkg:
        - installed

npm:
    pkg:
        - installed
        - require:
            - pkg: nodejs

npm-pkgs:
    npm.installed:
        - names:
            - jshint
        - require:
            - pkg: nodejs
            - pkg: npm
