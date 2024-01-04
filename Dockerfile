FROM node:20-bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends --no-install-suggests nginx

COPY nginx.conf /etc/nginx/nginx.conf

COPY container-start.sh start.sh /usr/local/bin

STOPSIGNAL SIGQUIT

ENTRYPOINT [ "start.sh" ]

CMD [ "serve" ]
