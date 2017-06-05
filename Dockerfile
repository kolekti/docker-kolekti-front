FROM debian:jessie

RUN apt-get update && apt-get install -y \
      apache2                            \
      apache2-mpm-worker                 \
      libapache2-mod-wsgi                \
      libapache2-svn                     \
      subversion                         \
    && rm -rf /var/lib/apt/lists/*

RUN a2enmod proxy_http authz_groupfile
ADD kolekti.conf /etc/apache2/conf-enabled/kolekti.conf

ADD entrypoint.sh /
CMD /entrypoint.sh

EXPOSE 80
EXPOSE 443
