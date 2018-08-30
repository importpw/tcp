# tcp

Simple shell scripting APIs for spawning a TCP server. This is basically a
high-level wrapper around `socat`.


## Example

Launch a "Hello World" TCP server:

```bash
#!/usr/bin/env import
import tcp@0.0.2

tcp_server echo hello world
```

And interact with it using `netcat`, or `telnet`:

```
$ netcat localhost 3000
hello world
```


## API

### `tcp_server $command`

 * `port` - Optional port number to bind to. Defaults to `3000`.

Spawns a TCP server that executes the given `command` upon every connection to
the server. The server binds to the `port` using the _reuseaddr_ flag.

```bash
#!/usr/bin/env import
import tcp@0.0.2

# Imagine that `redis-server.sh` implements the Redis RESP protocol
port=6379 tcp_server ./redis-server.sh
```
