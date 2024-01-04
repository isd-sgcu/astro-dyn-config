# Astro dyn config
Astro static-site generation is awesome. But once you have build your site, 
you can no longer change the environment variable you have which is quite
unfortunate. This base image is a workaround for this problem.

# How to use
Create dockerfile which inherit from this base image, then add the source file
of your project. It should install dependency but not build the site (because
building is delegated to container starting process). There's no need to write
`CMD` and `ENTRYPOINT` directive. For example. 
```dockerfile
FROM ghcr.io/isd-sgcu/astro-dyn-config:latest

WORKDIR /app

COPY public package*.json .env astro.config.mjs tailwind.config.mjs tsconfig.json ./

RUN npm ci

COPY src ./src

EXPOSE 8080
```
You can also add enable other package manager here.

## Overridding config
### container-start.sh
This script run everytime the nginx start. Its purpose is to regenerate the
site with new config and copy new site to where nginx will look for.

### nginx.conf
Standard nginx.conf, you can override setting here. The default setting is
configured for astro deployment. And it's configured to exposed 8080 port,
however you can freely change it.

# How does it work
Normally containerization flow would be like build an image and it's ready to
be deploy. But we know that astro, once build, can not change its environment
variable. So our solution is to delegate build step to container starting
process. This mean that the site is rebuild every time the container start
which sound inefficient. But to be fair, container does not restart that often
and cost of CSR/SSR would be much more significant comparing to building
everytime application start.