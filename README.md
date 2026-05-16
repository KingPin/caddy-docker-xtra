
# caddy-docker-xtra

[![Docker Image CI](https://github.com/KingPin/caddy-docker-xtra/actions/workflows/docker-publish.yml/badge.svg?branch=main)](https://github.com/KingPin/caddy-docker-xtra/actions/workflows/docker-publish.yml) | 
[![Docker Repository on Quay](https://quay.io/repository/kingpinx1/caddy-docker-xtra/status "Docker Repository on Quay")](https://quay.io/repository/kingpinx1/caddy-docker-xtra) | ![Docker Pulls](https://img.shields.io/docker/pulls/kingpin/caddy-docker-xtra)

Caddy webserver v2 in a docker with a lot of plugins enabled. 

The docker containers are built for amd64 & arm64 / aarch64. 

Its available at docker under 
* *kingpin/caddy-docker-cloudflaredns:latest*
* *ghcr.io/kingpin/caddy-docker-cloudflaredns:latest* 
* *quay.io/kingpinx1/caddy-docker-xtra*

## Breaking changes (2026-05)

The image is moving to semver-major Docker tags so consumers can opt out of
breaking changes:

| Tag | Plugin set | Updates |
|---|---|---|
| `:v1` | Frozen snapshot of the pre-cleanup image (published 2024-12-23). Includes the old `caddy-authorize`, `caddy-auth-portal`, `vrongmeal/caddygit`, `RussellLuo/caddy-ext/ratelimit`, `gamalan/caddy-tlsredis`, `abiosoft/caddy-hmac`, `abiosoft/caddy-exec`, `WingLim/caddy-webhook`. | Never rebuilt — frozen forever. |
| `:v2` / `:latest` | Current plugin set documented in the **List of modules** section below. | Rebuilt weekly. |

To stay on the old plugin set, pin one of:

```
kingpin/caddy-docker-xtra:v1
ghcr.io/kingpin/caddy-docker-xtra:v1
quay.io/kingpinx1/caddy-docker-xtra:v1
```

Or pin the immutable manifest digest (works on all three registries):

```
@sha256:b165698a7b164e7885e46804cc09f4e435f2b4eaba98a74c8e17a9f6ada3a47b
```

### Auth modules merged into caddy-security

`greenpau/caddy-authorize` and `greenpau/caddy-auth-portal` have both been
archived upstream and merged into a single replacement module,
[`greenpau/caddy-security`](https://github.com/greenpau/caddy-security).

If your `Caddyfile` uses `authorize { ... }` or `auth_portal { ... }`
directives, you need to rewrite them as `security { ... }` blocks before
moving to `:v2`. See the
[caddy-security docs](https://github.com/greenpau/caddy-security) for the new
syntax.

### Git module replaced

`vrongmeal/caddygit` is archived and its README directs users to the
maintained replacement
[`greenpau/caddy-git`](https://github.com/greenpau/caddy-git).

Caddyfile syntax for the `git { ... }` block differs between the two modules;
see the new plugin's docs for the updated configuration.

**docker run** : 

    docker run -it --name caddy \
         -p 80:80 \
         -p 443:443 \
         -v ./caddy_data:/data \
         -v ./caddy_config:/config \
         -v ./Caddyfile:/etc/caddy/Caddyfile \
         kingpin/caddy-docker-xtra

**Docker-compose.yml**

    version: "3.7"
    services:
      caddy:
        image: ghcr.io/kingpin/caddy-docker-xtra:latest
        container_name: caddy
        ports:
          - 80:80
          - 443:443
        volumes:
                - './caddy/Caddyfile:/etc/caddy/Caddyfile'
                - './caddy/caddy_data:/data'
                - './caddy/caddy_config:/config'
        restart: unless-stopped


this is a bare basic example, you may need to modify it further to suit your setup. Visit the plugin pages below to get the config options for each one.

List of modules : 


* https://github.com/greenpau/caddy-security
* https://github.com/caddy-dns/cloudflare
* https://github.com/caddy-dns/digitalocean
* https://github.com/caddy-dns/hetzner
* https://github.com/caddy-dns/googleclouddns
* https://github.com/caddy-dns/vultr
* https://github.com/caddy-dns/gandi
* https://github.com/caddy-dns/azure
* https://github.com/caddy-dns/duckdns
* https://github.com/caddy-dns/namecheap
* https://github.com/caddy-dns/route53
* https://github.com/mastercactapus/caddy2-proxyprotocol
* https://github.com/mholt/caddy-dynamicdns
* https://github.com/lolPants/caddy-requestid
* https://github.com/hairyhenderson/caddy-teapot-module
* https://github.com/mholt/caddy-webdav
* https://github.com/WingLim/caddy-webhook
* https://github.com/greenpau/caddy-git
* https://github.com/abiosoft/caddy-exec
* https://github.com/gamalan/caddy-tlsredis
* https://github.com/porech/caddy-maxmind-geolocation
* https://github.com/muety/caddy-remote-host
* https://github.com/pteich/caddy-tlsconsul
* https://github.com/greenpau/caddy-trace
* https://github.com/abiosoft/caddy-hmac
* https://github.com/RussellLuo/caddy-ext/ratelimit
* https://github.com/techknowlogick/caddy-s3browser
* https://github.com/mastercactapus/caddy2-proxyprotocol
* https://github.com/baldinof/caddy-supervisor

