for dest in `cat destinations`
do
	scp `cat scripts.list` tomcat7@$dest:/var/lib/otp/
done
