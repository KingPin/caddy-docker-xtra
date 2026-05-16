FROM caddy:builder-alpine AS builder

RUN xcaddy build \
    --with github.com/greenpau/caddy-security \
    --with github.com/caddy-dns/digitalocean \
    --with github.com/caddy-dns/hetzner \
    --with github.com/caddy-dns/googleclouddns \
    --with github.com/caddy-dns/vultr \
    --with github.com/caddy-dns/gandi \
    --with github.com/caddy-dns/azure \
    --with github.com/caddy-dns/duckdns \
    --with github.com/caddy-dns/namecheap \
    --with github.com/caddy-dns/route53 \
    --with github.com/mholt/caddy-dynamicdns \
    --with github.com/lolPants/caddy-requestid \
    --with github.com/hairyhenderson/caddy-teapot-module \
    --with github.com/mholt/caddy-webdav \
    --with github.com/greenpau/caddy-git \
    --with github.com/porech/caddy-maxmind-geolocation \
    --with github.com/muety/caddy-remote-host \
    --with github.com/pteich/caddy-tlsconsul \
    --with github.com/greenpau/caddy-trace \
    --with github.com/mholt/caddy-ratelimit \
    --with github.com/baldinof/caddy-supervisor \
    --with github.com/mholt/caddy-l4 \
    --with github.com/caddy-dns/cloudflare


FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
