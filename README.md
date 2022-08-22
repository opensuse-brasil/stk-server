# stk-server

Container image to run a [SuperTuxKart](https://supertuxkart.net/) server.

## Build

```bash
podman build -t stk-server . --no-cache
```

## Push

```bash
podman push stk-server opensusebr/stk-server:latest
podman push stk-server opensusebr/stk-server:$(date +"%Y%m%d")
```

## Pull

```bash
podman pull opensusebr/stk-server
```

## Run

```bash
podman run -it --rm -p 2757:2757 -p 2759:2759 -e STK_USER="user" -e STK_PASSWORD="pwd" -e STK_SERVER_NAME="openSUSE Brasil" opensusebr/stk-server
```

## Environment Variables

### STK_CONFIG

The server configuration file.

Default: `/stk/config.xml`

### STK_SERVER_NAME

The server name on the global network.
This will override the name in the config file.

Default: **Not Set**

### STK_MOTD

The MOTD to show in the lobby (can be a txt file).
This will override the MOTD in the config file.

Default: **Not Set**

### STK_USER

The user to authenticate.

Default: **Not Set**

### STK_PASSWORD

The user password to authenticate.

Default: **Not Set**

## Volumes

### /stk

The path where config files and DB will be placed.

If you mount this volume you can change `/stk/config.xml` and `/stk/motd.txt` to your needs.
