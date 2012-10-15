for x (fang admin); do
    hash -d $x="$HOME/repos/${x}site/"
    hash -d ${x}deploy="$HOME/repos/${x}site/deploy/"
    hash -d ${x}django="$HOME/repos/${x}site/module/ssldjango/"
    hash -d ${x}webroot="$HOME/repos/${x}site/webroot/"
done
