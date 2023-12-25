# Docker_IPTV-EPG
[![](https://github.com/seiferma/Docker_IPTV-EPG/actions/workflows/docker-publish.yml/badge.svg?branch=main)](https://github.com/seiferma/Docker_IPTV-EPG/actions?query=branch%3Amain+)
[![](https://img.shields.io/github/issues/seiferma/Docker_IPTV-EPG.svg)](https://github.com/seiferma/Docker_IPTV-EPG/issues)
[![](https://img.shields.io/github/license/seiferma/Docker_IPTV-EPG.svg)](https://github.com/seiferma/Docker_IPTV-EPG/blob/main/LICENSE)

Image encapsulating the EPG grabber from [iptv-org/epg](https://github.com/iptv-org/epg). After an initial grabbing, it executes the grabbing every 4 hours.

## Usage

The docker image is available under `quay.io/seiferma/iptv-epg:latest` (see the [registry page](https://quay.io/repository/seiferma/iptv-epg?tab=tags) for available versions).

The container requires
* a configuration file mounted at `/opt/iptv-epg/custom_channels.xml` (see [iptv-org/epg](https://github.com/iptv-org/epg#use-custom-channel-list) for valid contents)
* a volume or bind mount for the output `/opt/iptv-epg/output/epg.xml`

To configure the UID/GID, you can use the environment variables
* `EPG_UID` (default is `1500`)
* `EPG_GID` (default is `1500`)
