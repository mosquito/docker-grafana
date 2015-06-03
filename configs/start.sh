#!/bin/bash

j2 -f env /etc/templates/grafana.j2 > /etc/grafana/grafana.ini

cd /usr/share/grafana

exec /usr/sbin/grafana-server \
		--config=/etc/grafana/grafana.ini \
		cfg:default.paths.logs=/var/log/grafana \
		cfg:default.paths.data=/var/lib/grafana
