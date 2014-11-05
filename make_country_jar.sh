country=$1
(cd src/client/js/otp;cp $country.config.js config.js)
mvn clean package -DskipTests
cp target/otp.jar $country-otp.jar
for dest in 'gee-1' 'gee-2'
do
	scp $country-otp.jar  tomcat7@$dest:/var/lib/otp/
done
