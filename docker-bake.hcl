variable "IPTV_HASH" {
  default = "283c87ba8085eb54cbd2d22c0fa508ae221dc780"
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
