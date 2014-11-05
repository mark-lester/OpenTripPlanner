cd /var/lib/otp
for country in `cat countries`
do
./make_graph.sh $country
done
