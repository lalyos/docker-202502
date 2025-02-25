Docker Install

# Windows

```yaml {"vsls_cell_id":"d5bc0985-f962-4446-989e-8d3ac8292a35"}

```

```yaml {"vsls_cell_id":"bca3669a-4da1-46c5-ac42-f1e1cbc9cc02"}

```

- Legyél bejelentkezve VPN-be
- Töltsd le: [Docker Desktop telepito](https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe)-t
- Telepítsd a Docker Desktopot, **adminként**
- **legyen bepipálva, hogy WSL2 instead of HyperV**

## Elso Inditas

A telepies vegevel a "Docker Desktop Alkalmazas" valoban telepult, de az elso inditasnal fog csinalni egy uj Virtualis gepet (windowsul: WSL-t)

| Note1: A telepites elsore ugy tunik hogy nem tortenik semmi ... Varjal. Ha hibat jelez hagydd neki hogy probalja javitani

| Note2: Ha azt a hibat irja hogy "Recover wsl ...", akkor okezd le es ujranidul. (ez tobbszor is lehet majd kesobb)

Ha sikerult a telepites azt ugy ellenorzod hogy egy terminalban/cmd-ben latod a **cliens** es a **server**
verziojat is.

```yaml {"vsls_cell_id":"4b07df07-6ba3-4948-9ab3-7d4e4c3390f0"}
docker version

Client:
 Version:           27.5.1
 ....
Server: Docker Engine - Community
 Engine:
  Version:          27.5.1
 ....
```

## Training kornyezet

Innentol mukodik a docker a gepeden **DE**
a docker parancsokat egysegesen egy bash shellben fogjuk gepelni ,hogy windows/linux/mac userek is beture ugyanazt gepelhessek.

| Ne hasznalj: cmd-t, powershell-t vagy git-bash-t, mingw-t (illetve lehet de akkor nincs support:)

A Windowsosok egy **wsl** (vagyis egy linuxos vm-ben) fogjak gepelni a parancsokat.

De nem a `docker-desktop` nevezut **wsl** ben dolgozunk, hanem csinalunk egy Ubuntu (vagy Debian) alapu masik wsl-t:

A wsl-letrehozasara a cmd-t hasznaljuk (**adminkent**):

```sh {"vsls_cell_id":"e85a86c5-c00a-4a8a-bdfd-301ce3a718b0"}
wsl -l -v
... TODO .. lecci copypasteld be mit ir itt
```

Látszódjon, hogy van docker-desktop vm, wsl version 2-ben

```sh {"vsls_cell_id":"14513a14-b1e5-48ba-869e-90b455e61f25"}
wsl --install -d Ubuntu
wsl --set-default Ubuntu
```

Ezzel telepitetted az ubuntu vm-et (wsl), es mivel beallitottuk hogy az Ubuntu legyen a default, ezek utan ugy mesz bele a wsl-be hogy (cmd-bol, powershellbol, Start menubol)

```sh {"vsls_cell_id":"8429689c-3ff7-4a77-bdfb-a273ebd7a259"}
wsl
# itt mar Ubuntuban vagy
... TODO .. lecci copypasteld be mit ir itt
```

## Docker - wsl integracio

Ha kesz az **Ubuntu wsl** akkor lepj ki belole (exit). Majd a **Docker Desktop** felso lecen, a jobboldali fogaskerek icont kattinds meg

... todo screenshot ...

- Resources
- WSL integration
- Ubuntut kapcsold be a toggle puttonyt
- Apply and Restart

```yaml {"vsls_cell_id":"6fcbc24e-6e6f-4717-a091-2ba853b32c1f"}
wsl
# megvaltozik a prompt
docker version
Client:
 Version:           27.5.1
 ....
Server: Docker Engine - Community
 Engine:
  Version:          27.5.1
```

örülsz !!!

