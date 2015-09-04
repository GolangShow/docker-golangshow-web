#!/bin/sh
nginx
remote_syslog2 -p <PORT> -d logs3.papertrailapp.com --pid-file=/var/run/remote_syslog.pid /data/*.log
bash
