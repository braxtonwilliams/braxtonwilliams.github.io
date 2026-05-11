# www.brax10.site & www.brax10.org Traefik setup

This project is configured to be served by Traefik at:

- `http://www.brax10.site`
- `https://www.brax10.site`
- `https://www.brax10.org` (public CNAME)

## Prerequisites

- Docker and Docker Compose installed
- A running Traefik instance with entrypoints named `web` and `websecure`
- A Docker network named `dev_proxy` that Traefik is connected to

## DNS Configuration

Ensure both domains point to your server IP:
- `www.brax10.site` A record → server IP
- `www.brax10.org` CNAME → `www.brax10.site`

## Build the static site

The HTML files are generated from shared content. Regenerate before (re)building the container:

`make build`

## Start the site container

From this project directory:

`docker compose up -d --build`

## Verify

Open:

- `http://www.brax10.site`
- `https://www.brax10.site`
- `https://www.brax10.site/resume.html`

Or via curl:

`curl -I https://www.brax10.site`
