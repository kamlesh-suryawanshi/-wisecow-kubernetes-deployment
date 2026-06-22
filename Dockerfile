FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y \
    fortune-mod \
    cowsay \
    netcat-openbsd && \
    apt-get clean

ENV PATH="/usr/games:$PATH"

WORKDIR /app

COPY wisecow.sh .

RUN sed -i 's/\r$//' wisecow.sh && \
    chmod +x wisecow.sh

EXPOSE 4499

CMD ["/bin/bash", "./wisecow.sh"]