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


## Volumes

```
docker run -dP -v www:/usr/share/nginx/html     nginx
```