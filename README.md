# docker-gollum
dockerized gollum (git backed wiki) server

## Usage
Let's assume you have your wiki's git repo in ~/git/wik.  
Here's a script you could use to start the wiki server with this docker image: `runWiki.sh`
```bash
#!/bin/bash

LOCAL_WIKI_DIR=~/git/wiki

docker stop wiki
docker rm wiki
docker run --name wiki -p 80:80 -p 443:443 -d -v ${LOCAL_WIKI_DIR}:/wiki l3iggs/gollum
```
Then browse to http://localhost to see your wiki!
