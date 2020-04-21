# docker_jenkins
Jenkins instance running under docker. You must have a Traefik configured to be able to run it correctly.

To change the jenkins home folder add the new path to the *docker/docker-compose-swarm.yml* file (in the *environment* and *volumes* part )

## Build the image

```bash
make build
```

## Start the container

```bash
make start
```

## Stop the container

```bash
make stop
```