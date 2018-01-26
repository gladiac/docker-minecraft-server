# docker-minecraft-server
A small minecraft-server docker image based on alpine

Build Instructions
------------------
```bash
$ git clone https://github.com/gladiac1337/docker-minecraft-server.git
$ cd docker-minecraft-server
$ docker build -t minecraft-server:latest -t minecraft-server:1.12.2 .
```

Usage Example
-------------

NOTE: You need to accept the Minecraft EULA via the EULA environment variable to run this docker image!

```bash
$ docker run --rm -e EULA=1 -v /var/lib/minecraft:/var/lib/minecraft minecraft-server:latest
```
