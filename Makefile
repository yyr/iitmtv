BIN = /usr/bin
SYSTEMD = /lib/systemd/system

all:
	@echo "Run 'make install'  as super user (or using sudo) to install the script"
	@echo "Run 'make uninstall' as super user (or using sudo) to uninstall the script"
	@echo "Run 'make start'  as super user (or using sudo) to start all services"
	@echo "Run 'make stop'  as super user (or using sudo) to stop all services"

install:
	[ -d ${SYSTEMD} ] && cp imd.service ${SYSTEMD}/
	[ -d ${SYSTEMD} ] && cp imd2.service ${SYSTEMD}/
	[ -d ${SYSTEMD} ] && cp wisc.service ${SYSTEMD}/

uninstall:
	[ -f ${SYSTEMD}/imd.service ] && rm  ${SYSTEMD}/iitmtv.service
	[ -f ${SYSTEMD}/imd2.service ] && rm  ${SYSTEMD}/iitmtv.service
	[ -f ${SYSTEMD}/wisc.service ] && rm  ${SYSTEMD}/iitmtv.service

start:
	systemctl start imd.service
	systemctl start imd2.service
	systemctl start wisc.service

stop:
	systemctl stop imd.service
	systemctl stop imd2.service
	systemctl stop wisc.service

.PHONY: all