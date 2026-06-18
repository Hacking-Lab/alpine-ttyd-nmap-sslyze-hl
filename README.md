# alpine-ttyd-nmap-sslyze-hl
## Introduction
Alpine Docker Image with ttyd-hl
- nmap
- socat
- sslyze

This image extends `hackinglab/alpine-base-hl:3.2` with a browser-accessible ttyd shell and network/security tooling.

The bundled `libwebsockets-config.cmake` keeps ttyd linked against Alpine's libwebsockets package with libuv support. Without that, ttyd can fail at startup with `libwebsockets context creation failed`.

![Screenshot](./img/screenshot-ttyd.png)

## Base Image
https://github.com/Hacking-Lab/alpine-base-hl

## Docker Hub
https://hub.docker.com/repository/docker/hackinglab/alpine-ttyd-nmap-sslyze-hl

```bash
services:
  alpine-ttyd-nmap-sslyze-hl:
    build: .
    image: hackinglab/alpine-ttyd-nmap-sslyze-hl:3.2
    restart: always
    environment:
      - AUTHOR=e1
      - HL_USER_USERNAME=root
      - HL_USER_PASSWORD=compass
      - HL_ROOT_PASSWORD=compass
      - GOLDNUGGET=flag
    ports:
      - 7681:7681
```

## Maintenance

Build and publish multi-architecture images with:

```bash
./build-multi-arch.sh 3.2
```


## References
* fix is based on https://github.com/matti/docker-alpine-libwebsockets-with-libuv
* https://github.com/tsl0922/ttyd
* https://github.com/void-linux/void-packages/issues/19441
* https://gitlab.alpinelinux.org/alpine/aports/-/issues/11936
