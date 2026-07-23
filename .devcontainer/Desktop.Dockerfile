FROM lscr.io/linuxserver/webtop:ubuntu-xfce

COPY activity.js /defaults/cloud-desktop-activity.js
COPY selkies-nginx.conf /defaults/default.conf
