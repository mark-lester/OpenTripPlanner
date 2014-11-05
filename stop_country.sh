cd /var/lib/otp
echo STOPPING `date` >> $1-server.log
kill `cat $1-server.pid`
