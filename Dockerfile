FROM l3iggs/archlinux-aur
MAINTAINER l3iggs <l3iggs@live.com>

# Install gollum
RUN yaourt -S --noconfirm --needed gollum

# switch to root
USER 0

# make wiki dir
RUN mkdir /wiki

# start apache
CMD gollum --port 80 --allow-uploads /wiki
