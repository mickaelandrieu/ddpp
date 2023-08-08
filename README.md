# DDPP: the modern Dockerized Data Plateform Project

<p align="center">
  <img
    width="460"
    src="docs/ddpp_logo_readme.png">
</p>

## Installation Guide

1. Install docker & docker compose
2. Clone this repository
3. Create a docker network
4. Install and configure the softwares you want to use

```
docker network create ddpp
```

## TODO LIST

> This project is in active Work in Progress state

- NGINX Proxy Manager ✅
- Portainer ✅
- Metabase ✅
- Matomo ✅
- N8N ✅
- Clickhouse ✅
- Prefect
- Authelia
- Airbyte
- Shop (As an exemple)


## Softwares

### NGINX Proxy Manager

Nginx Proxy Manager is an open-source software that provides a graphical user interface (GUI) for managing Nginx reverse proxy servers. It simplifies the configuration process for load balancing, SSL termination, and access control, making it an ideal tool for managing web servers.

> `docker-compose up -f nginx_proxy_manager/docker-compose.yaml -d`

As a reminder, here are the __default admin user__ credentials:

```
Email:    admin@example.com
Password: changeme
```

This software is available at port 81, once configured behind HTTPS and a domain name, you should remove the port 81 from the docker configuration and your server.

#### Before

```
# nginx_proxy_manager/docker-compose.yaml
ports:
    - 80:80
    - 443:443
    - 81:81
```

#### After

```
ports:
    - 80
    - 443:443
    - 81
```

Then **use** NGINX Proxy Manager to configure every other software, so they are not directly available through their specific HTTP ports on the public network but **only** through the dedicated docker network you have created on installation process.

### Portainer

Portainer is an open-source universal container management software that can work with both Docker and Kubernetes to make the deployment and management of containerized applications and services easier and more efficient.

Once setup, every software will appears into Portainer UI.

> `docker-compose up -f portainer/docker-compose.yaml -d`

### Metabase

Metabase is an open-source business intelligence tool that allows for powerful data instrumentation, visualization, and querying.

Once you have installed Metabase using the docker-compose command (`docker-compose up -f metabase/docker-compose.yaml -d`), it is required to access ``<metabase_url>/setup`` to finalize the installation.

### n8n

n8n is a "free, fair code, self-hosted workflow automation tool." In simple terms? It’s an open source software that integrates with other apps, to automate processes between them.

> `docker-compose up -f nginx_proxy_manager/docker-compose.yaml -d`

## License

This project is under MIT license, and every project used is under open source license and available for commercial use.


