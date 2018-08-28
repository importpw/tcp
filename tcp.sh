tcp_server() {
  local _port="${port-3000}"
  local command="$(echo $* | sed -e 's/:/\\:/g')"
  exec socat "TCP4-LISTEN:${_port},fork,reuseaddr" "EXEC:$command"
}
