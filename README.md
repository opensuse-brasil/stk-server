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
podman run -it --rm -p 2757:2757 -p 2759:2759 -e USERNAME="user" -e PASSWORD="pwd" -e SERVER_NAME="openSUSE Brasil" opensusebr/stk-server
```

## Environment Variables

### SERVER_NAME

The server name on the global network.

Default: `STK`

### STK_CONFIG

The server configuration file.

Default: `/stk/config.xml`

### MOTD_FILE

The MOTD file to show in the lobby.

Default: `/stk/motd.txt`

### USERNAME

The user to authenticate.

Default: **Not Set**

### RSYNC_PASSWORD

The user password to authenticate.

Default: **Not Set**

## Volumes

### /stk

The path where config files and DB will be placed.

If you mount this volume you can change `/stk/config.xml` and `/stk/motd.txt` to your needs.
