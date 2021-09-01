#!/bin/bash

sed -i'' -e "s/VDR_PORT = .*/VDR_PORT = ${SVDRP_PORT}/" /etc/vdradmin-am/vdradmind.conf
sed -i'' -e "s/SERVERPORT =.*/SERVERPORT = ${VDRADMIN_PORT}/" /etc/vdradmin-am/vdradmind.conf
