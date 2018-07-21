tcp_server() {
  local _port="${port-3000}"
  exec socat "TCP4-LISTEN:${_port},fork,reuseaddr" "EXEC:$*"
}
