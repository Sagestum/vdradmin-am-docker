FROM ubuntu:latest

ENV SVDRP_PORT=6419 \
    VDRADMIN_PORT=8001 \
    ENTRYPOINTS_DIR=/opt/qnib/entry
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y locales
RUN sed -i -e 's/# de_DE.UTF-8 UTF-8/de_DE.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=de_DE.UTF-8
RUN apt-get update \
 && apt-get install -y vdradmin-am locales \
 && locale-gen "de_DE.UTF-8" \
 && echo "LC_ALL=de_DE.UTF-8" >> /etc/environment \
 && echo "LANG=de_DE.UTF-8" >> /etc/environment 
ENV LC_ALL de_DE.UTF-8
ENV LANG de_DE.UTF-8
ENV LANGUAGE de_DE.UTF-8
COPY etc/vdradmind.conf /etc/vdradmin-am/
COPY opt/qnib/entry/10-vdradmin.sh /opt/qnib/entry/
CMD ["vdradmind", "--nofork", "-l", "7", "-d", "/etc/vdradmin-am/"]
