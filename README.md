# docker-gollum
dockerized gollum (git backed wiki) server

## Usage
Let's assume you have a git repo for your wiki in ~/git/wiki  
Here's a script you could use to start the wiki server inside this docker image: `runWiki.sh`
```
#!/bin/bash

LOCAL_WIKI_DIR=~/git/wiki

docker stop wiki
docker rm wiki
docker run --name wiki -p 80:80 -p 443:443 -d -v ${LOCAL_WIKI_DIR}:/wiki l3iggs/gollum
```
Then browse to  
http://localhost  
or  
https://localhost  
The default user/password is gollum/gollum

Note that this example exposes the wiki both via http and https. You can expose only one of port 80 or 443 if you wish.

**[Optional] Edit the default login credentials**  
You can add `-e WIKI_USER=john -e WIKI_PASS=letmein` to the docker run command line to require the user/password john/letmein for login to your wiki.

**[Optional] Use your own ssl certificate**  
This image comes with a self-generated ssl certificate and so you'll get browser warnings when you access your wiki via https (but the connection will be encrypted (with a private key that anyone can view by snooping around in the image)). You can (& should) replace these self signed certificates with your own, properly generated cert files.
Assuming you have `server.crt` and `server.key` files in a directory `~/sslCert` on the host machine:   
`sudo chown -R root ~/sslCert; sudo chgrp -R root ~/sslCert`  
`sudo chmod 400 ~/sslCert/server.key`   
You can then add `-v ~/sslCert:/https` to the docker run command line to use your properly generated ssl certificate files.
