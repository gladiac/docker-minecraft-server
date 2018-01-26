#!/bin/sh

JAVA_HOME="/usr/lib/jvm/default-jvm/jre"
JAVA="${JAVA_HOME}/bin/java"

set -e

mkdir -p "/var/lib/minecraft/${MC_LEVEL}"
cd "/var/lib/minecraft/${MC_LEVEL}"

case "$EULA" in
    1|true|TRUE) echo eula=true > eula.txt
    ;;
    *) echo "You need to accept the Minecraft EULA!"; exit 127
    ;;
esac

exec ${JAVA} \
    ${JAVA_ARGS} \
    -jar "/opt/minecraft/minecraft_server.jar" \
    nogui
