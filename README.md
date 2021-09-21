# A simple integration of ELK stack and Keycloak

A simple integration to test oidc configuration

## Requirements

- [docker]()
- [docker-compose]()

## Pre-configurations

Create `.env` file at the project root with these following environment variables with suitable values

```sh
ELK_TAG=7.14.1
ELASTIC_PASSWORD=changeme
```

## Run, stop and clean

- Run ELK-Keycloak stack with `docker-compose up`

- Stop it with `docker-compose down` (delete containers only)

- Clean it with `docker-compose down -v` (delete containers and persistent volumes)

## References

- [Elasticsearch](https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html)
- [Kibana](https://www.elastic.co/guide/en/kibana/current/docker.html)
- [OIDC config](https://www.elastic.co/guide/en/elasticsearch/reference/current/oidc-guide.html)
- [docker-elk](https://github.com/deviantony/docker-elk/tree/tls) an all-in one ELK docker stack configured with TLS
- [Keycloak]()
- [ELK with Keycloak]()
