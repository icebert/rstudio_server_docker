## Rstudio server

Start:

```
docker run -d --name rstudio -p 8989:8787 -v /local/dir:/home/USER icebert/rserver
```

Create user matching local user:

```
docker exec rstudio groupadd USER -g 1024

docker exec rstudio useradd USER -u 1024 -g 1024 -d /home/USER -s /bin/bash
```

or use interactive command:

```
docker exec -it rstudio /bin/bash
```
