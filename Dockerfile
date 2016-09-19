FROM davask/d-apache2-openssl:2.4-u14.04
MAINTAINER davask <contact@davaskweblimited.com>
USER root
LABEL dwl.server.proxy="proxy"

# declare container type
ENV DWL_INIT proxy

# install proxy
RUN a2enmod proxy
RUN a2enmod proxy_http
RUN a2enmod proxy_ajp
RUN a2enmod deflate
RUN a2enmod proxy_balancer
RUN a2enmod proxy_connect
RUN a2enmod proxy_html
RUN a2enmod xml2enc
