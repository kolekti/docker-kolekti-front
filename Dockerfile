FROM debian:stretch

RUN apt-get update && apt-get install -y \
      apache2                            \
      libapache2-mod-wsgi                \
      libapache2-mod-svn                 \
      subversion                         \
      curl                               \
&& rm -rf /var/lib/apt/lists/*

RUN a2enmod proxy_http authz_groupfile
ADD kolekti.conf /etc/apache2/conf-enabled/kolekti.conf

ADD entrypoint.sh /
CMD /entrypoint.sh

EXPOSE 80
EXPOSE 443
