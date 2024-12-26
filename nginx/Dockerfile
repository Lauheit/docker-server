FROM nginx:1.27.3-alpine

COPY nginx.conf /etc/nginx/nginx.conf
COPY cpu_load.sh /usr/local/bin/
#COPY nginx-env.sh /usr/local/bin/

COPY static/ /var/www/html/
COPY cert/ /etc/nginx/ssl/

RUN apk add --no-cache sysstat nginx-mod-http-image-filter envsubst && \
	chown -R nginx:nginx /var/log/nginx && \
	chown -R nginx:nginx /var/www/html && \
	chown -R nginx:nginx /etc/nginx && \
  chown -R nginx:nginx /var/cache/nginx && \
	touch /var/run/nginx.pid && \
	chown -R nginx:nginx /var/run/nginx.pid 

# USER nginx


#CMD ["/bin/sh", "-c", "/usr/local/bin/nginx-env.sh && /usr/local/bin/cpu_load.sh & nginx -g 'daemon off;'"]
CMD ["/bin/sh", "-c", "/usr/local/bin/cpu_load.sh & nginx -g 'daemon off;'"]
