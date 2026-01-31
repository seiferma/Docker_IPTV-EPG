# syntax=docker/dockerfile:1.7-labs
FROM node:24-alpine AS builder
ARG IPTV_HASH

RUN apk add --no-cache git ca-certificates
RUN git clone https://github.com/iptv-org/epg.git /tmp/epg
WORKDIR /tmp/epg
RUN git checkout $IPTV_HASH
RUN npm install --omit=dev


FROM node:24-alpine

# configuration layer
WORKDIR /opt/epg
ENTRYPOINT ["npm", "run", "grab", "--"]

# dependency layer
COPY --from=builder /tmp/epg/node_modules ./node_modules

# application layer
COPY --from=builder --exclude=/tmp/epg/node_modules --exclude=/tmp/epg/.git /tmp/epg ./
