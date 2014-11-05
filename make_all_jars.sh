for country in `cat countries`
do
echo $country;
./make_country_jar.sh $country
done
./install_scripts.sh
# put the public one back
(cd src/client/js/otp;cp config.js.non-specific config.js)
