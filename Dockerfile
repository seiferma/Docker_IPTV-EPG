FROM busybox:latest AS downloader
ADD https://github.com/iptv-org/epg/archive/refs/heads/master.zip /tmp/master.zip
RUN mkdir -p /usr/src/app && \
    unzip /tmp/master.zip -d /tmp && \
    touch /tmp/epg-master/custom_channels.xml && \
    mkdir -m 777 /tmp/epg-master/output


FROM node:21-alpine

ENV EPG_DIR=/opt/iptv-epg
WORKDIR ${EPG_DIR}
ENTRYPOINT ["/start.sh"]
CMD ["default"]

RUN apk add --no-cache su-exec
COPY start.sh /start.sh

COPY --from=downloader /tmp/epg-master ./
RUN npm --prefix ./ install
