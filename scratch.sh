# cleanup

docker rm -f web mariska generator 2>/dev/null
sleep 5
docker volume rm www etlapdb 2>/dev/null

docker run -dP \
  --name web \
  -v www:/usr/share/nginx/html \
  nginx


docker run -d \
  -e MARIADB_ROOT_PASSWORD=s3cr3t \
  -v etlapdb:/var/lib/mysql \
  -v $PWD/sql:/docker-entrypoint-initdb.d \
  --name mariska  \
  mariadb

docker run -d \
  -v www:/www \
  --link mariska:db \
  ttl.sh/generator
