country=$1
case $country in
    thailand )
        github_name=Thailand ;;
    srilanka )
        github_name=Sri-Lanka ;;
    myanmar )
        github_name=Myanmar ;;
    bangladesh )
        github_name=Bangladesh ;;
    laos )
        github_name=Laos ;;
    india )
        github_name=India ;;
    mumbai )
        github_name=Mumbai ;;
    bangalore )
        github_name=Bangalore ;;
    kualalumpur )
        github_name=Kuala-Lumpur ;;
esac
echo INDEXING   $country $github_name `date` 
export country github_name
(cd /var/gee/$country/$github_name; git fetch ; git merge origin/master )
(cd /var/gee/$country; make -f /var/lib/otp/Graph-Makefile country=$country github_name=$github_name )
#java -Xmx6G -jar $1-otp.jar --build ~/$1

