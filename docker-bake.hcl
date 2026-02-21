variable "IPTV_HASH" {
  default = "20a8790b36f771eaae23eac2ddaf5f8675d9040a"
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
