
# caddy-docker-xtra
Caddy webserver v2 in a docker with a lot of plugins enabled. 

The docker containers are built for amd64 & arm64 / aarch64. 

Its available at docker under 
* *kingpin/caddy-docker-cloudflaredns:latest*
* *ghcr.io/kingpin/caddy-docker-cloudflaredns:latest* 
* *quay.io/kingpinx1/caddy-docker-xtra*

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


* https://github.com/greenpau/caddy-authorize
* https://github.com/greenpau/caddy-auth-portal
* https://github.com/caddy-dns/cloudflare
* https://github.com/caddy-dns/digitalocean
* https://github.com/caddy-dns/hetzner
* https://github.com/caddy-dns/googleclouddns
* https://github.com/caddy-dns/vultr
* https://github.com/caddy-dns/leaseweb
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
* https://github.com/vrongmeal/caddygit/module/git
* https://github.com/abiosoft/caddy-exec
* https://github.com/gamalan/caddy-tlsredis
* https://github.com/porech/caddy-maxmind-geolocation
* https://github.com/muety/caddy-remote-host
* https://github.com/pteich/caddy-tlsconsul
* https://github.com/greenpau/caddy-trace
* https://github.com/abiosoft/caddy-hmac
* https://github.com/RussellLuo/caddy-ext/ratelimit
* https://github.com/techknowlogick/caddy-s3browser
* https://github.com/ggicci/caddy-jwt
* https://github.com/mastercactapus/caddy2-proxyprotocol
* https://github.com/baldinof/caddy-supervisor

