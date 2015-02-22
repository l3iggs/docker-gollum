FROM l3iggs/archlinux-aur
MAINTAINER l3iggs <l3iggs@live.com>

# Install gollum
RUN yaourt -S --noconfirm --needed gollum

# start gollum
CMD gollum
