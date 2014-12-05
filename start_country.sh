#!/bin/bash
cd /var/lib/otp
host=`hostname`
if [ "$host" == "gee-1" ]
then
echo "REMOTE on gee-2"
ssh 'gee-2' /var/lib/otp/start_country.sh $1
exit
fi
echo "RUNNING on " `hostname`
 
country=$1
echo "START COUNTRY" $country `date`
./stop_country.sh $country
LOGFILE=/var/lib/otp/$country-server.log
echo "STOPPED COUNTRY" $country `date`
sleep 2;
echo "SLEPT COUNTRY" $country `date`
case $country in
    thailand )
        port1=8100;port2=8200 ;;
    srilanka )
        port1=8101;port2=8201 ;;
    myanmar )
        port1=8102;port2=8202 ;;
    bangladesh )
        port1=8103;port2=8203 ;;
    laos )
        port1=8104;port2=8204 ;;
    india )
        port1=8105;port2=8205 ;;
    mumbai )
        port1=8106;port2=8206 ;;
    banglaore )
        port1=8107;port2=8207 ;;
    kualalumpur )
        port1=8108;port2=8208 ;;
esac
echo STARTING `date` >> $LOGFILE
nohup /usr/bin/java \
	-Xmx4096M \
	-jar /var/lib/otp/$country-otp.jar \
	--server \
	-g /var/gee/$country \
	-p $port1 \
	--securePort $port2\
	>> $LOGFILE &
server_pid=$!
echo $server_pid > $country-server.pid
echo "STARTED COUNTRY" $country `date`
echo "STARTED process $server_pid" >> $LOGFILE
ps wwaux | grep $country >> $LOGFILE
sleep 30;
