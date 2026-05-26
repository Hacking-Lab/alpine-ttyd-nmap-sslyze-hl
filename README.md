# alpine-ttyd-nmap-sslyze-hl
Alpine Docker Image with ttyd-hl
- nmap
- socat
- sslyze
- socat
* problem: libwebsockets without -DLWS_WITH_LIBUV=ON breaks ttyd package
* fixing the problem with https://github.com/void-linux/void-packages/issues/19441
* fixing the problem with https://gitlab.alpinelinux.org/alpine/aports/-/issues/11936
* fixing the problem: libwebsockets context creation failed


Acknowledgment libwebsocket solution
* fix is based on https://github.com/matti/docker-alpine-libwebsockets-with-libuv

Acknowledgment ttyd 
* https://github.com/tsl0922/ttyd
