FROM davask/d-apache:2.4-d8.8
MAINTAINER davask <docker@davaskweblimited.com>
USER root
LABEL dwl.server.proxy="proxy"

# http://stackoverflow.com/questions/7312215/is-there-a-way-to-remove-apaches-reverse-proxy-request-headers?answertab=votes#tab-top
# https://www.x4b.net/kb/RealIP-Apache

# install proxy
RUN a2enmod proxy
RUN a2enmod proxy_http
RUN a2enmod proxy_ajp
RUN a2enmod deflate
RUN a2enmod proxy_balancer
RUN a2enmod proxy_connect
RUN a2enmod proxy_html
RUN a2enmod xml2enc

COPY ./build/dwl/default/etc/apache2/sites-available/_proxy-rules.conf /dwl/default/etc/apache2/sites-available/_proxy-rules.conf
RUN cp -rdf /dwl/default/etc/apache2/sites-available/_proxy-rules.conf /etc/apache2/sites-available/_proxy-rules.conf

COPY ./build/dwl/default/etc/apache2/sites-available/0000-docker.davaskweblimited.com-80.conf /dwl/default/etc/apache2/sites-available/0000-docker.davaskweblimited.com-80.conf
RUN chown root:sudo -R /dwl
USER admin

