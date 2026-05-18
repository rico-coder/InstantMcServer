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

- Set a secure password in ```rcon.password```
- Generate a new ```management-server-secret```. On Linux, you can use this command: ```openssl rand -hex 32```

In docker-compose.yml:

- Change ```-Xms2G -Xmx4G``` to fit your server's RAM. Just change the numbers for this.

Start the server with ```docker compose up -d```

## Info

start.sh automatically installs fabric and accepts the Minecraft EULA on first startup.

To add Mods, simply add their .jar files into the ```mods/``` folder.
