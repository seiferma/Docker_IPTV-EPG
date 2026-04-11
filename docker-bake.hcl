variable "IPTV_HASH" {
  default = "ff41b18d7c5d0ea65dd89e721971a72e5ba3fa49"
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
