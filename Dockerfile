FROM gliderlabs/alpine:latest 

RUN \
  apk update && \
  apk add wget && \
  apk add nodejs && \
  apk add nginx

RUN mkdir /tmp/nginx
RUN mkdir -p /usr/share/nginx

RUN wget --no-check-certificate https://github.com/mobz/elasticsearch-head/archive/master.tar.gz -O /tmp/elasticsearch-head.tar.gz
RUN tar zxvf /tmp/elasticsearch-head.tar.gz -C /tmp && mv /tmp/elasticsearch-head-master /usr/share/nginx/html && rm -rf /tmp/elasticsearch-head.tar.gz

WORKDIR /usr/share/nginx/html
RUN npm install

ADD ./files/nginx.conf /etc/nginx/nginx.conf

EXPOSE 9100

CMD ["nginx", "-g", "daemon off; error_log stderr info;"]
