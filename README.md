# Twitch Live Downloader

Proactively download Twitch streams as they go live.

Volumes:

- `/download/` for downloaded vods
- `/config/` (optional) for user specified configuration in `user_config.config`

Docker compose example:

```yaml
services:
  twitch_dl:
    container_name: twitch_dl
    build:
      context: /path/to/here
      dockerfile: Dockerfile
      args:
        # Set to your user id and group id to avoid permission issues
        UID: 1000
        GID: 1000
    volumes:
      - /path/to/download:/download
      - /path/to/config:/config
    # Set to the channels you want to download
    command: jerma985 vinesauce nyanners
    restart: unless-stopped
```
