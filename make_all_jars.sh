for country in `cat countries`
do
echo $country;
./make_country_jar.sh $country
done
./install_scripts.sh
