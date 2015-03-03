FROM l3iggs/archlinux-aur
MAINTAINER l3iggs <l3iggs@live.com>

# add rack config file
ADD config.ru /home/docker/config.ru

# install better webserver
RUN yaourt -S --noconfirm --needed ruby-thin

# Install gollum
RUN yaourt -S --noconfirm --needed gollum

# for working in the image
RUN sudo pacman --noconfirm --needed -S vim

# switch to root
USER 0

# make wiki dir
RUN mkdir /wiki

# cd to wiki dir
WORKDIR /wiki

# start gollum via thin server and rack file
CMD thin start --ssl -p 443 -R /home/docker/config.ru

#CMD gollum --allow-uploads --port 80 /wiki
