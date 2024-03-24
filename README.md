# Docker_IPTV-EPG
[![](https://github.com/seiferma/Docker_IPTV-EPG/actions/workflows/docker-publish.yml/badge.svg?branch=main)](https://github.com/seiferma/Docker_IPTV-EPG/actions?query=branch%3Amain+)
[![](https://img.shields.io/github/issues/seiferma/Docker_IPTV-EPG.svg)](https://github.com/seiferma/Docker_IPTV-EPG/issues)
[![](https://img.shields.io/github/license/seiferma/Docker_IPTV-EPG.svg)](https://github.com/seiferma/Docker_IPTV-EPG/blob/main/LICENSE)

Image encapsulating the EPG grabber from [iptv-org/epg](https://github.com/iptv-org/epg).

## Usage

The docker image is available under `quay.io/seiferma/iptv-epg:latest` (see the [registry page](https://quay.io/repository/seiferma/iptv-epg?tab=tags) for available versions).

Pass the parameters to the `grab` action as command. See [iptv-org/epg](https://github.com/iptv-org/epg?tab=readme-ov-file#usage) for parameters.