## Alias

If you want shorten long commands typed often use aliases

```

alias dll='docker logs $(docker ps -ql)'
alias dup='docker compose up -d --build'
alias drml='docker rm -f $(docker ps -ql)'
alias drn='docker rename $(docker ps -ql)'
alias food='docker compose exec db mariadb -ps3cr3t mysql -e "select * from food"'
```

## Env vars

If the env var is only used by the shell itself, no export is needed
```
FOOD=pacal
echo "my fav food is: ${FOOD}"
```

## export

if a subprocess needs an env var you have to `export`.
export can be comined with declaration
```
cat > x.sh <<"EOF"
#!/bin/bash
echo == subprocess=== your fav food is: ${FOOD}
EOF
chmod +x x.sh
```

```
# doesnt print pizza
FOOD=pizza
./x.sh 
```
Even without export you can set env var for a subprocess:
```
FOOD=hotdog ./x.sh
```

or use the export sytax:
```
export FOOD=bagel
./x.sh
```



```
FOOD=pizza
export FOOD
```
has the same effect as
```
export FOOD=piza
```

## Substions

https://docs.docker.com/compose/how-tos/environment-variables/variable-interpolation/

- simple: `${VAR}`
- with default: `${VAR:-default}`
- required: `${VAR:?error}`
- alternarive: `${VAR:+replacement}` 

## Quotation

in single quotes no substituion is done
```
FOOD=pizza
echo '$FOOD'    # $FOOD
echo "$FOOD"    # pizza
echo "${FOOD}"  # pizza - preferred syntax CANONICAL
```

## Here-doc

Instead of:
-  `echo first LINE> a.txt`
-  `echo second line >> a.txt`

You can copy paste full file in the "stomac" of the heredoc
```
cat > index.html <<EOF
<html>
  <body bgcolor='${COLOR:-gray}'>
    <h1>${TITLE:-Welcome}</h1>
    <hr>
    Created: $(date)
  </body>
</html>
EOF
```

## She-bang

Each script has to start with `#!` line, which tells
which program will interpret the rest of the file

`chmod +x script.sh` is also needed

| avoid full path in shebang: `#!/opt/bin/python3`

prefern using the `env` builtin, which uses the `$PATH`
`#!/usr/bin/env python3`

## Exec

In docker images if you have a `start.sh` shell script as CMD (or entryoint)

Make sure that the last line uses `exec`
``` bash
#!/usr/bin/env bash

echo somethin > /www/index.html
exec nginx -g 'daemon off;'
```

This way `nginx` will be PID1 and will handle signals (SIGTERM/SIGHUP/SIGKILL) correctly

In compose you can workaround this issue by using:
```
service:
  web:
    image: myweb
    cmd: /start.sh
    init: true
```