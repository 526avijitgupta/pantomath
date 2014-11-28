# http://www.booking.com/searchresults.en-us.html?src=country&nflt=&ss_raw=Bangalore%2C+Karnataka%2C+India&from_autocomplete=1&error_url=http%3A%2F%2Fwww.booking.com%2Fcountry%2Fin.en-us.html%3Faid%3D357026%3Blabel%3Dgog235jc-country-XX-in-XX-unspec-in-com-L%253Axu-O%253Aunk-B%253Aunk-N%253AXX-S%253Abo%3Bsid%3D42a44a15a5bc79382376195703433b12%3Bdcid%3D4%3Binac%3D0%26%3B&bb_asr=2&aid=357026&dcid=4&label=gog235jc-country-XX-in-XX-unspec-in-com-L%3Axu-O%3Aunk-B%3Aunk-N%3AXX-S%3Abo&sid=42a44a15a5bc79382376195703433b12&si=ai%2Cco%2Cci%2Cre%2Cdi&ss=Bangalore%2C+Karnataka%2C+India&checkin_monthday=17&checkin_year_month=2015-10&checkout_monthday=19&checkout_year_month=2015-10&no_rooms=1&group_adults=2&group_children=0

# Check for why is price not being displayed!

from lxml import html
import requests
# import csv
# from time import sleep

city = "Bangalore%2C+Karnataka%2C+India"
checkin_day = "29"
checkin_year_month = "2014-11"
checkout_day = "30"
checkout_year_month = "2014-11"
no_of_rooms = "1"
no_of_adults = "1"
no_of_children = "0"

# city = str(raw_input("Enter the city!")).replace(" ","+").replace(",","%2C") = "Bangalore, Karnataka, India"
# checkin_day = str(raw_input("Enter the date of check-in")) = "29"
# checkin_year_month = str(raw_input("Enter the year-month of check-in")) = "2014-11"
# checkout_day = str(raw_input("Enter the date of check-out")) = "30"
# checkout_year_month = str(raw_input("Enter the year-month of check-out")) = "2014-11"
# no_of_rooms = str(raw_input("Enter the number of rooms")) = "1"
# no_of_adults = str(raw_input("Enter the number of adults")) = "1"
# no_of_children = str(raw_input("Enter the number of children")) = "0"

URL_FIXED_11 = "http://www.booking.com/searchresults.en-us.html?src=country&nflt=&ss_raw="
URL_FIXED_12 = "&from_autocomplete=1&error_url=http%3A%2F%2Fwww.booking.com%2Fcountry%2Fin.en-us.html%3Faid%3D357026%3Blabel%3Dgog235jc-country-XX-in-XX-unspec-in-com-L%253Axu-O%253Aunk-B%253Aunk-N%253AXX-S%253Abo%3Bsid%3D42a44a15a5bc79382376195703433b12%3Bdcid%3D4%3Binac%3D0%26%3B&bb_asr=2&aid=357026&dcid=4&label=gog235jc-country-XX-in-XX-unspec-in-com-L%3Axu-O%3Aunk-B%3Aunk-N%3AXX-S%3Abo&sid=42a44a15a5bc79382376195703433b12&si=ai%2Cco%2Cci%2Cre%2Cdi&ss="
URL_FIXED_13 = "&checkin_monthday="
URL_FIXED_14 = "&checkin_year_month="
URL_FIXED_15 = "&checkout_monthday="
URL_FIXED_16 = "&checkout_year_month="
URL_FIXED_17 = "&no_rooms="
URL_FIXED_18 = "&group_adults="
URL_FIXED_19 = "&group_children="

ultimate_url = URL_FIXED_11 + city + URL_FIXED_12 + city + URL_FIXED_13 + checkin_day + URL_FIXED_14 + checkin_year_month + URL_FIXED_15 + checkout_day + URL_FIXED_16 + checkout_year_month + URL_FIXED_17 + no_of_rooms + URL_FIXED_18 + no_of_adults + URL_FIXED_19 + no_of_children

print ultimate_url

page = requests.get(ultimate_url)
tree = html.fromstring(page.text)

hotel_names = []
hotel_ratings = []
hotel_prices = []

hotel_names = tree.xpath("//a[@class='hotel_name_link url refine_hotelname_4']/text()")
hotel_ratings = tree.xpath("//span[@class='average']/text()")

hotel_prices = tree.xpath("//div[@class='b-group-recommendation__price']/text()")

print hotel_names
print hotel_ratings
print hotel_prices

# b = open('hotel.csv', 'wb')
# a = csv.writer(b)

# for temp_hotel_name in hotel_names:
# 	a.writerows([temp_hotel_name])

file = open("hotels.txt","w")

for temp_hotel_name in hotel_names:
  file.write("%s" % temp_hotel_name)

values = [list([item]) for item in lst]
cursor.executemany(u'INSERT INTO `tb`(`Data`)(%s)', values)