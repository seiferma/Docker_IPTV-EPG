variable "IPTV_HASH" {
  default = "4a77ccd8e3acc8e38383434fc3ed28e7c3c19b99"
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
