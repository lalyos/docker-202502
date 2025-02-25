## Dockerfile



```
docker build -t web .
docker run -d -p 9876:80 web
```

## Go home
```
docker run -dP \
  --env TITLE='Huzzunk haza' \
  web
```


## Notes

- [] nginx -g 'daemon off;'
- [] jid 
- [] quotation

## tl;dr

```
wsl -d ubuntu
 
Benkom              tgb543efb
docker run -it ubuntu
docker run -it -p 9999:80 lunch
 
docker ps -a
doker ps -n 3
docker attach container név
ctrl-p ctrl-q detach
 
Docker commit conténer név image név pl. docker commit ubul rider
 
docker images
docker rm conténernév
docker container prune
```

## Images - tag

... todo

# Volumes

## Named Volune
```
docker run -it --rm --volume data:/data  ubuntu

## inside of the container
date > /data/a.txt
echo "itt jartam (lalyos)" >> /data/a.txt
```

- docker volume ls
- docker voilume rm
- docker volume inspect

## Mariadb

```
docker run -d -e MARIADB_ROOT_PASSWORD=s3cr3t mariadb
alias drl='docker rename $(docker ps -ql)'
drl mariska
docker exec -it mariska bash
## inside of the cont
mariadb -ps3cr3t mysql
```

```
alias food="docker exec mariska  mariadb -ps3cr3t mysql -e 'select * from food'"
```
container restart
```
docker stop mariska
## food !$#@!$#!
docker start mariska
food
```
Disaster recovery
```
docker run -d -e MARIADB_ROOT_PASSWORD=s3cr3t -v 6f32095c5e97f4612a2ccb798fd9e47b8c024790293cff88c8ce602bbe104700:/var/lib/mysql --name mariska  mariadb
```

## Food example

```
docker run -d \
  -e MARIADB_ROOT_PASSWORD=s3cr3t \
  -v etlapdb:/var/lib/mysql \
  --name mariska  \
  mariadb
```


## Init db

[Initialization Docs](https://hub.docker.com/_/mariadb) look for the **Initializing the database contents
** section

```
docker run -d \
  -e MARIADB_ROOT_PASSWORD=s3cr3t \
  -v etlapdb:/var/lib/mysql \
  -v $PWD/sql:/docker-entrypoint-initdb.d \
  --name mariska  \
  mariadb
```

## Multi arch image build

Docker is able to build **multi-arch images** to list the available arch/platform:
```
docker buildx ls --format '{{ .Platforms }}'
```
See complete [docs](https://docs.docker.com/build/building/multi-platform/)

To build an image for multiple platforms:
```
docker buildx build \
  --push \
  --platform linux/arm64/v8,linux/amd64 \
  --tag ttl.sh/lalyos/web .
```