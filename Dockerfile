# syntax=docker/dockerfile:1.7-labs
FROM node:21-alpine AS builder
ADD https://github.com/iptv-org/epg/archive/refs/heads/master.zip /tmp/master.zip
RUN mkdir -p /usr/src/app && \
    unzip /tmp/master.zip -d /tmp
WORKDIR /tmp/epg-master
RUN npm install --omit=dev


FROM node:21-alpine

# configuration layer
WORKDIR /opt/epg
ENTRYPOINT ["npm", "run", "grab", "--"]

# dependency layer
COPY --from=builder /tmp/epg-master/node_modules ./node_modules

# application layer
COPY --from=builder --exclude=/tmp/epg-master/node_modules /tmp/epg-master ./
