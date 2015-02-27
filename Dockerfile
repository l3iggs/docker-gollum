FROM l3iggs/archlinux-aur
MAINTAINER l3iggs <l3iggs@live.com>

# Install gollum
RUN yaourt -S --noconfirm --needed gollum

# switch to root
USER 0

# make wiki dir
RUN mkdir /wiki

ENV BASEPATH="/"

# start apache
CMD gollum --allow-uploads --base-path ${BASEPATH} --port 80 /wiki
