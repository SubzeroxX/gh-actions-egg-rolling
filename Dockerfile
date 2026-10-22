FROM debian:12-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN useradd -m -d /home/container container

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    jq \
    ca-certificates \
    libicu72 \
    libssl3 \
    && rm -rf /var/lib/apt/lists/*

COPY --chmod=777 ./entrypoint.sh /worker/entrypoint.sh

USER container
ENV USER=container HOME=/home/container
RUN mkdir -p $HOME
WORKDIR /home/container

ENTRYPOINT ["/bin/bash", "/worker/entrypoint.sh"]