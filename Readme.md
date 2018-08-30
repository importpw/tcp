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

And interact with it using `netcat` / `telnet`:

```
$ netcat localhost 3000
hello world
```
