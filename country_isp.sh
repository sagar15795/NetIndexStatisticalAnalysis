c_list=('"SG"' '"PM"' '"HK"' '"JP"' '"RO"' '"IN"' '"US"' '"GB"' '"CL"' '"GM"' '"FI"' '"PK"' '"ES"' '"CN"' '"AU"' '"SY"' '"GN"' '"GQ"' '"CD"' '"LK"')

for country in ${c_list[*]}; do 
	head -n 1 country_daily_speeds.csv > $country".csv"
	grep $country country_daily_speeds.csv >> $country".csv"
done