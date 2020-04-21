## Get Started

#### Install Node Package

```
$ direnv allow

$ npm i socket.io
```

#### Dnsmasq Settings

```
$ vim docker-compose.yml

// Change IP address
services:
  webrtc-dnsmasq:
    extra_hosts:
      - "webrtc.local:192.168.2.204"
      - "socket.webrtc.local:192.168.2.204"
```

#### Start WebRTC

```
$ docker-compose up -d
```

Check if you can access the domain you set

* [https://webrtc.local](https://webrtc.local)
* [https://socket.webrtc.local/socket.io/socket.io.js](https://socket.webrtc.local/socket.io/socket.io.js)


