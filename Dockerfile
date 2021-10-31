FROM caddy:builder-alpine AS builder

RUN xcaddy build \
    --with github.com/greenpau/caddy-authorize \
    --with github.com/greenpau/caddy-auth-portal \
    --with github.com/caddy-dns/digitalocean \
    --with github.com/caddy-dns/hetzner \
    --with github.com/caddy-dns/googleclouddns \
    --with github.com/caddy-dns/vultr \
    --with github.com/caddy-dns/leaseweb \
    --with github.com/caddy-dns/gandi \
    --with github.com/caddy-dns/azure \
    --with github.com/caddy-dns/duckdns \
    --with github.com/caddy-dns/namecheap \
    --with github.com/caddy-dns/route53 \
    --with github.com/mastercactapus/caddy2-proxyprotocol \
    --with github.com/mholt/caddy-dynamicdns \
    --with github.com/lolPants/caddy-requestid \
    --with github.com/hairyhenderson/caddy-teapot-module \
    --with github.com/mholt/caddy-webdav \
    --with github.com/WingLim/caddy-webhook \
    --with github.com/vrongmeal/caddygit/module/git \
    --with github.com/abiosoft/caddy-exec \
    --with github.com/gamalan/caddy-tlsredis \
    --with github.com/porech/caddy-maxmind-geolocation \
    --with github.com/muety/caddy-remote-host \
    --with github.com/pteich/caddy-tlsconsul \
    --with github.com/greenpau/caddy-trace \
    --with github.com/abiosoft/caddy-hmac \
    --with github.com/RussellLuo/caddy-ext/ratelimit \
    --with github.com/techknowlogick/caddy-s3browser \
    --with github.com/ggicci/caddy-jwt \
    --with github.com/mastercactapus/caddy2-proxyprotocol \
    --with github.com/baldinof/caddy-supervisor \
    --with github.com/caddy-dns/cloudflare


FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
