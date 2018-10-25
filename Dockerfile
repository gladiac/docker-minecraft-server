FROM openjdk:11.0.1-slim-sid

ENV MC_VERSION=1.13.2 \
    MC_DLPATH=3737db93722a9e39eeada7c27e7aca28b144ffa7 \
    JAVA_ARGS="-server -Xms512M -Xmx2048M -XX:+UseG1GC -XX:+CMSClassUnloadingEnabled -XX:ParallelGCThreads=2 -XX:MinHeapFreeRatio=5 -XX:MaxHeapFreeRatio=10" \
    MC_LEVEL=world \
    EULA=0

RUN apt-get update && \
    apt-get install -y wget && \
    mkdir -p "/opt/minecraft" && \
    cd "/opt/minecraft" && \
    wget "https://launcher.mojang.com/v1/objects/${MC_DLPATH}/server.jar" -O minecraft_server.jar && \
    apt-get purge -y wget

VOLUME ["/var/lib/minecraft"]
EXPOSE 25565

COPY docker-entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD []
