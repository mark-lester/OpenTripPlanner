#!/bin/bash
   # chkconfig: 2345 20 80
   # description: Description comes here....

   # Source function library.
#   . /etc/init.d/functions

   start() {
	/var/lib/otp/start_otp.sh
     # code to start app comes here 
   }

   stop() {
     # code to stop app comes here 
	/var/lib/otp/stop_otp.sh
   }

   restart() {
     # code to stop app comes here 
	/var/lib/otp/stop_otp.sh
	/var/lib/otp/start_otp.sh
   }

   case "$1" in 
    start)
        start
        ;;
    stop)
        stop
        ;;
    retart)
        stop
        start
        ;;
    *)
         echo "Usage: $0 {start|stop|restart}"
   esac

   exit 0
 
