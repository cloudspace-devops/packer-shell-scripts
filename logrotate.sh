cat <<EOF|sudo tee /etc/logrotate.d/app
 /srv/www/*/shared/*.log {
	weekly
	missingok
	rotate 52
	compress
	delaycompress
	notifempty
	create 0640 app adm
	sharedscripts
	prerotate
		if [ -d /etc/logrotate.d/app-prerotate ]; then \
			run-parts /etc/logrotate.d/app-prerotate; \
		fi \
	endscript
	postrotate
		[ -s /srv/www/*/unicorn.pid ] && kill -USR2 `cat /srv/www/*/unicorn.pid`
	endscript
}
EOF
