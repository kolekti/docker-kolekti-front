FROM debian:jessie

RUN apt-get update && apt-get install -y \
      apache2                            \
      apache2-mpm-worker                 \
      libapache2-mod-wsgi                \
      libapache2-svn                     \
      python-pip                         \ 
      python-django                      \
      subversion                         \
    && rm -rf /var/lib/apt/lists/*

ADD requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN a2enmod proxy_http socache_shmcb authn_socache
ADD kolekti.conf /etc/apache2/conf-enabled/kolekti.conf

ADD entrypoint.sh /
CMD /entrypoint.sh
#CMD apache2ctl -D FOREGROUND 

EXPOSE 80
EXPOSE 443
