# InstantMcServer

Instant Fabric Minecraft Server made by Claude, [ebholi](https://github.com/ebholi) and [rico-coder](https://github.com/rico-coder)

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
level-seed=CUSTOM_SEED
```

If you're not happy with your current world, you can use the command chain below to delete it and generate a new one. This will use the seed in server.properties:

``` docker
docker compose down

rm -rf server/world

docker compose up -d
```

You will not have to whitelist again since that's saved elsewhere.

## Whitelist

In order to whitelist yourself on the server, run the following commands:

``` docker cli
docker attach <container id>

whitelist add <username>
```

`docker attach` will give you access to all the logs from the server.


## OP Player
``` docker cli
docker attach <container id>

op <username>
```

## Server Icon

In order to add a server icon, you must add a 64x64 file named exactly "server-icon.png". Then restart the server using `docker compose restart`.

## Info

start.sh automatically installs fabric and accepts the Minecraft EULA on first startup.

To add Mods, simply add their .jar files into the `mods/` folder.
