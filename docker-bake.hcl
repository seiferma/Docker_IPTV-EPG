variable "IPTV_HASH" {
  default = "15251d66554039e4b379a520a0449e256f9e7892"
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
