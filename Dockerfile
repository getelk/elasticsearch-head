FROM getelk/alpine-nginx:latest

RUN apk add --update wget

RUN rm -r /usr/share/nginx/html
RUN wget --no-check-certificate https://github.com/mobz/elasticsearch-head/archive/master.tar.gz -O /tmp/elasticsearch-head.tar.gz && \
  tar zxf /tmp/elasticsearch-head.tar.gz -C /tmp && \
  rm -rf /tmp/elasticsearch-head.tar.gz
RUN ln -sf /tmp/elasticsearch-head-master /usr/share/nginx/html

WORKDIR /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]