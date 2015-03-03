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

# set wiki repo variable
ENV WIKI_REPO /wiki

# start gollum twice
# once for https and once for http
CMD thin start -d -p 80 -R /home/docker/config.ru; thin start -d --ssl -p 443 -R /home/docker/config.ru
