BIN = /usr/bin
SYSTEMD = /lib/systemd/system

all:
	@echo "Run 'make install'  as super user (or using sudo) to install the script"
	@echo "Run 'make uninstall' as super user (or using sudo) to uninstall the script"

install:
	[ -d ${SYSTEMD} ] && cp iitmtv.service ${SYSTEMD}/

uninstall:
	[ -f ${SYSTEMD}/iitmtv.service ] && rm  ${SYSTEMD}/iitmtv.service

.PHONY: all
