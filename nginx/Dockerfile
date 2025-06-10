FROM nginx:latest

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/http_redirect.conf /etc/nginx/conf.d/http_redirect.conf
COPY ./conf/upstream_backends.conf /etc/nginx/conf.d/upstream_backends.conf

COPY ./certs/ /etc/nginx/certs/

# COPY ./lua/ /etc/nginx/lua/

CMD [ "nginx", "-g", "daemon off;" ]