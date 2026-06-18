FROM hackinglab/alpine-base-hl:3.2
LABEL maintainer="Ivan Buetler <ivan.buetler@hacking-lab.com>"

RUN set -eux; \
    apk add --no-cache \
        libuv \
        json-c \
        libwebsockets \
        libwebsockets-evlib_uv \
        openssl; \
    apk add --no-cache --virtual .ttyd-build-deps \
        alpine-sdk \
        cmake \
        git \
        json-c-dev \
        libuv-dev \
        libwebsockets-dev \
        openssl-dev \
        zlib-dev; \
    git clone --depth=1 https://github.com/tsl0922/ttyd.git /ttyd

COPY libwebsockets-config.cmake /usr/lib/cmake/libwebsockets/

RUN set -eux; \
    cmake -S /ttyd -B /ttyd/build; \
    cmake --build /ttyd/build; \
    cmake --install /ttyd/build; \
    apk del .ttyd-build-deps; \
    rm -rf /ttyd /root/.cache /var/cache/apk/*

RUN set -eux; \
    apk add --no-cache \
        bash \
        bind-tools \
        ca-certificates \
        coreutils \
        curl \
        findutils \
        git \
        iproute2 \
        iputils \
        john \
        jq \
        lftp \
        ldns-tools \
        nano \
        net-tools \
        netcat-openbsd \
        ngrep \
        nmap \
        nmap-ncat \
        nmap-scripts \
        openssh-client \
        openssl \
        proxychains-ng \
        py3-pip \
        py3-virtualenv \
        python3 \
        samba-client \
        socat \
        tcpdump \
        tshark \
        vim \
        wget \
        whois; \
    update-ca-certificates; \
    python3 -m venv /opt/sslyze-venv; \
    /opt/sslyze-venv/bin/pip install --no-cache-dir --upgrade pip setuptools wheel; \
    /opt/sslyze-venv/bin/pip install --no-cache-dir sslyze; \
    ln -s /opt/sslyze-venv/bin/sslyze /usr/local/bin/sslyze; \
    rm -rf /var/cache/apk/*
 
COPY root /

EXPOSE 7681
