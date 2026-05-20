# instantfabric

Instant Fabric Minecraft Server made by Claude

## Server Folder Structure

``` folder
your-server/
├── docker-compose.yml
├── mods/
└── server/
    ├── start.sh
    └── server.properties
```

## Startup

Before starting up, configure the server.

In server.properties:

- Set a secure password in `rcon.password`

In docker-compose.yml:

- Change `-Xms2G -Xmx4G` to fit your server's RAM. Just change the numbers for this.

Start the server with `docker compose up -d`

## World Seed

To set a custom world seed, either set it before the first start in the server.properties file:

``` server.properties
level-seed=8537
```

If you're not happy with your current world, you can use the command chain below to delete it and generate a new one. This will use the seed in server.properties:

``` docker
docker compose down

rm -rf server/world

docker compose up -d
```

## Whitelist

In order to whitelist yourself on the server, run the following commands:

``` docker cli
docker attach <container id>

whitelist add <username>
```

`docker attach` will give you access to all the logs from the server.

## Info

start.sh automatically installs fabric and accepts the Minecraft EULA on first startup.

To add Mods, simply add their .jar files into the `mods/` folder.

A .zip folder is included with some basic mods, mainly for performance & small enhancements. To use it, unzip the contents into the mods/ folder so that it only includes .jar files. If you don't unzip it, the file will be ignored.
