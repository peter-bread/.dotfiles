function get_wifi_ip_addr() {
  ipconfig getifaddr en0
}

function get_wifi_ip_addr2() {
  networksetup -getinfo Wi-Fi | rg "^IP address:" | awk '{print $3}'
}
