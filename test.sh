#!/bin/sh
set -eu
test -f "$HOME/.import.sh" || curl -sfS https://import.pw > "$HOME/.import.sh"
source "$HOME/.import.sh"
import "import.pw/assert@2.1.2"

source "./tcp.sh"

cleanup() {
  trap - EXIT SIGINT SIGSTOP
  kill "$pid"
}
trap cleanup EXIT SIGINT SIGSTOP

tcp_server echo foo &
pid=$!
sleep 0.2 # time to bind to the port
assert_equal "$(nc localhost 3000)" foo
assert_equal "$(nc localhost 3000)" foo
assert_equal "$(nc localhost 3000)" foo
