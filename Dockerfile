FROM hackinglab/alpine-base-hl:3.2
LABEL maintainer="Ivan Buetler <ivan.buetler@hacking-lab.com>"

RUN apk update && apk --no-cache add sudo alpine-sdk cmake zlib-dev libuv libuv-dev json-c json-c-dev libwebsockets libwebsockets-dev libwebsockets-evlib_uv openssl openssl-dev libwebsockets-dev && \
    git clone --depth=1 https://github.com/tsl0922/ttyd.git /ttyd

ADD libwebsockets-config.cmake /usr/lib/cmake/libwebsockets/

RUN cd /ttyd && mkdir build && cd build && \
    cmake .. && \
    make && sudo make install

# Update and install Alpine equivalent packages
RUN apk update && apk upgrade && \
    apk add --no-cache \
        bash \
        python3 \
        py3-pip \
        python3-dev \
        py3-virtualenv \
        build-base \
        libffi-dev \
        openssl-dev \
        cargo \
        rust \
        ca-certificates \
        bind-tools \
        coreutils \
        curl \
        findutils \
        john \
        proxychains-ng \
        jq \
        lftp \
        ldns-tools \
        ngrep \
        nmap \
        nmap-ncat \
        nmap-scripts \
        openssh-client \
        openssl \
        samba-client \
        tcpdump \
        tshark \
        nano \
        vim \
        wget \
        whois \
        git \
        iproute2 \
        netcat-openbsd \
        socat \
        net-tools \
        iputils && \
    update-ca-certificates && \
    python3 -m venv /opt/sslyze-venv && \
    /opt/sslyze-venv/bin/pip install --upgrade pip setuptools wheel && \
    /opt/sslyze-venv/bin/pip install sslyze && \
    ln -s /opt/sslyze-venv/bin/sslyze /usr/local/bin/sslyze && \
    rm -rf /var/cache/apk/*
 
ADD root /

EXPOSE 7681


