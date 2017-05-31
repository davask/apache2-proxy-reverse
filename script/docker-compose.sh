#/usr/bin/env bash

branch=${1};
parentBranch=${2};
rootDir=${3};
buildDir=${4};

######################
# docker-compose.yml #
######################

echo "d-apache-proxy-reverse:
  ports:
  - 80:80/tcp
  - 6409:22/tcp
  environment:
    DWL_LOCAL: en_US.UTF-8
    DWL_USER_ID: '1000'
    DWL_USER_PASSWD: secret
    DWL_LOCAL_LANG: en_US:en
    DWL_USER_NAME: username
    DWL_SSH_ACCESS: 'true'
    DWL_SHIELD_HTTP: 'false'
  image: davask/d-apache-proxy-reverse:${branch}
  hostname: localhost
  net: bridge
  volumes:
  - ${rootDir}/volumes/proxy/log/localhost/apache2:/var/log/apache2
  - ${rootDir}/volumes/home/username/http/app/sites-available:/etc/apache2/sites-available
  - ${rootDir}/volumes/home/username/files:/home/username/files
  working_dir: /var/www/html
" > ${rootDir}/docker-compose.yml

echo "docker-compose.yml generated with apache-proxy-reverse:${branch}";
