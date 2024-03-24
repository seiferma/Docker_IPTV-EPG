FROM busybox:latest AS downloader
ADD https://github.com/iptv-org/epg/archive/refs/heads/master.zip /tmp/master.zip
RUN mkdir -p /usr/src/app && \
    unzip /tmp/master.zip -d /tmp


FROM node:alpine

# configuration layer
WORKDIR /opt/epg
ENTRYPOINT ["npm", "run", "grab", "--"]

# dependency layer
COPY --from=downloader /tmp/epg-master/scripts ./scripts
COPY --from=downloader /tmp/epg-master/package*.json ./
RUN npm install --omit=dev

# application layer
COPY --from=downloader /tmp/epg-master ./
