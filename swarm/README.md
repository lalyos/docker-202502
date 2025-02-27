## Services - imperative

First Service
```
docker service create \
  --name web \
  --env TITLE="Thursda swarm" \
  --env COLOR2=orange \
  -p 80 \
  lalyos/12factor:v2.0
```

Check all the detail
```
docker service ls
docker service ps web
docker service inspect web
docker network ls
```

## Scale
```
docker service scale web=3
```

test loadbalancing
```
for i in {1..30} ; do 
  curl http://web.swarm.nisz.lol:30000/ -s | grep hostname
done \
|sort \
| uniq -c
```