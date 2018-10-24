FROM openjdk:11.0.1-slim-sid

ENV MC_VERSION=1.13.1 \
    MC_DLPATH=fe123682e9cb30031eae351764f653500b7396c9 \
    JAVA_ARGS="-server -Xms512M -Xmx2048M -XX:+UseG1GC -XX:+CMSClassUnloadingEnabled -XX:ParallelGCThreads=2 -XX:MinHeapFreeRatio=5 -XX:MaxHeapFreeRatio=10" \
    MC_LEVEL=world \
    EULA=0

RUN apt-get update && \
    apt-get install -y wget && \
    mkdir -p "/opt/minecraft" && \
    cd "/opt/minecraft" && \
    wget "https://launcher.mojang.com/mc/game/${MC_VERSION}/server/${MC_DLPATH}/server.jar" -O minecraft_server.jar && \
    apt-get purge -y wget

VOLUME ["/var/lib/minecraft"]
EXPOSE 25565

COPY docker-entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD []
