FROM l3iggs/archlinux-aur
MAINTAINER l3iggs <l3iggs@live.com>

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

# start apache
CMD gollum --allow-uploads --port 80 /wiki
