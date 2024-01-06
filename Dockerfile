FROM node:20-bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends --no-install-suggests nginx && mkdir -p /docker

COPY nginx.conf /etc/nginx/nginx.conf

COPY container-start.sh start.sh /docker

STOPSIGNAL SIGQUIT

ENTRYPOINT [ "bash", "/docker/start.sh" ]

CMD [ "serve" ]
