FROM davask/d-apache2:2.4-u14.04
MAINTAINER davask <docker@davaskweblimited.com>
LABEL dwl.server.proxy="proxy"

# install proxy
RUN a2enmod proxy
RUN a2enmod proxy_http
RUN a2enmod proxy_ajp
RUN a2enmod deflate
RUN a2enmod proxy_balancer
RUN a2enmod proxy_connect
RUN a2enmod proxy_html
RUN a2enmod xml2enc

RUN /bin/bash -c 'for conf in `find /etc/apache2/sites-enabled/ -type l`; do rm ${conf}; done;'
RUN /bin/bash -c 'for conf in `find /etc/apache2/sites-available/ -type f`; do rm ${conf}; done;'
# Configure apache virtualhost.conf
RUN /bin/bash -c 'cp -f /tmp/dwl/virtualhost.conf /etc/apache2/sites-available/${DWL_USER_DNS}.conf'
