FROM frolvlad/alpine-oraclejre8:latest

ENV MC_VERSION=1.12.2 \
    MC_DLPATH=886945bfb2b978778c3a0288fd7fab09d315b25f \
    JAVA_ARGS="-server -Xms512M -Xmx2048M -XX:+UseG1GC -XX:+CMSIncrementalPacing -XX:+CMSClassUnloadingEnabled -XX:ParallelGCThreads=2 -XX:MinHeapFreeRatio=5 -XX:MaxHeapFreeRatio=10" \
    MC_LEVEL=world \
    EULA=0

RUN mkdir -p "/opt/minecraft" && \
    cd "/opt/minecraft" && \
    wget "https://launcher.mojang.com/mc/game/${MC_VERSION}/server/${MC_DLPATH}/server.jar" -O minecraft_server.jar

VOLUME ["/var/lib/minecraft"]
EXPOSE 25565

COPY docker-entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD []
