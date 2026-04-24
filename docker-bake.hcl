variable "IPTV_HASH" {
  default = "e35bfb8158827060e33d9953627fbbbd5bfa0c80"
}

group "default" {
  targets = ["default"]
}

target "default" {
  platforms = ["linux/amd64", "linux/arm64"]
  tags = ["quay.io/seiferma/iptv-epg:latest"]
  args = {
    IPTV_HASH = "${IPTV_HASH}"
  }
}
