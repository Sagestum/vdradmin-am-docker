FROM qnib/dplain-init

ENV SVDRP_PORT=6419 \
    VDRADMIN_PORT=8001 \
    ENTRYPOINTS_DIR=/opt/qnib/entry
RUN apt-get update \
 && apt-get install -y vdradmin-am locales locales-all gcc-6-locales build-essential \
 && locale-gen "de_DE.UTF-8" \
 && dpkg-reconfigure locales
ENV LC_ALL de_DE.UTF-8
ENV LANG de_DE.UTF-8
ENV LANGUAGE de_DE.UTF-8
COPY etc/vdradmind.conf /etc/vdradmin-am/
COPY opt/qnib/entry/10-vdradmin.sh /opt/qnib/entry/
CMD ["vdradmind", "--nofork", "-l", "7", "-d", "/etc/vdradmin-am/"]
