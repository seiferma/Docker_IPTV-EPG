variable "IPTV_HASH" {
  default = "e4f92bb2a2768dcba3dbbd52b19d78d96bebc31e"
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
