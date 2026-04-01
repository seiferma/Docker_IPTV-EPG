variable "IPTV_HASH" {
  default = "03250d4a07eae90200d9e0af6962776e91d7a0c1"
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
