FROM lscr.io/linuxserver/webtop:ubuntu-xfce

COPY activity.js /tmp/cloud-desktop-activity.js
COPY selkies-nginx.conf /defaults/default.conf

RUN set -eux; \
    web_root=""; \
    for candidate in /usr/share/selkies/web /usr/share/selkies/www; do \
      if [ -f "${candidate}/index.html" ]; then web_root="${candidate}"; break; fi; \
    done; \
    test -n "${web_root}"; \
    install -m 0644 /tmp/cloud-desktop-activity.js "${web_root}/cloud-desktop-activity.js"; \
    sed -i 's#</body>#<script src="cloud-desktop-activity.js"></script></body>#' "${web_root}/index.html"; \
    rm -f /tmp/cloud-desktop-activity.js
