#
# Nginx Dockerfile
#
# https://github.com/dockerfile/nginx
#

# Pull base image.
FROM dockerfile/ubuntu

# Install Nginx.
RUN \
  add-apt-repository -y ppa:nginx/stable && \
  apt-get update && \
  apt-get install -y nginx && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx

ADD conf/nginx.conf /etc/nginx/
ADD conf/sites-enabled/clustermap2 /etc/nginx/site-templates/
ADD conf-bin /etc/nginx/conf-bin/

RUN \
  rm /etc/nginx/sites-enabled/default && \
  chown -R root:root /etc/nginx && \
  mkdir -p mkdir -p /var/cache/nginx/clustermap && \
  chown -R www-data:www-data /var/cache/nginx/clustermap && \
  chmod 755 /var && \
  chmod 755 /var/cache && \
  chmod -R 755 /var/cache/nginx/clustermap

# Define mountable directories.
# VOLUME ["/data", "/etc/nginx/sites-enabled", "/etc/nginx/conf.d", "/var/log/nginx"]

# Define working directory.
WORKDIR /etc/nginx

# Define default command.
CMD ["/etc/nginx/conf-bin/run-nginx"]

# Expose ports.
# EXPOSE 80
# EXPOSE 443
