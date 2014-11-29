# My first program primarily coded in emacs!
# This python script web scraps the details of the cab services available(car-type, car-fare) for the cities added to the dict

from lxml import html
import requests
import MySQLdb

# source_city = str(raw_input("Enter the source city:")).replace(" ","+")
# destination_city = str(raw_input("Enter the destination city:")).replace(" ","+")
journey_date = "30-11-2014"

city_list = ['New+Delhi', 'Bangalore', 'Kolkata', 'Mumbai', 'Hyderabad', 'Chennai']

city_dict = { 'New+Delhi':145 , 'Bangalore':377 , 'Kolkata':36 , 'Mumbai':114 , 'Hyderabad':223 , 'Chennai':81 }

URL_FIXED_11 = "http://www.savaari.com/select_cars.php?from_city="
URL_FIXED_12 = "&from_city_dummy="
URL_FIXED_13 = "&to_city="
URL_FIXED_14 = "&pickup_date=" # 17-11-2014
URL_FIXED_15 = "&duration=1&trip_type=3"

k = 0
for q in range(0, len(city_dict)):
  for w in range(0, len(city_dict)):
    if(w != q):
      source_city = city_list[q]
      destination_city = city_list[w]

      # depart_dummy = str(city_dict[source_city])

      # arrival_dummy = str(city_dict[destination_city])
      # print type(depart_dummy)
      # ultimate_url = URL_FIXED_11 + source_city + URL_FIXED_12 + depart_dummy + URL_FIXED_13 + destination_city + URL_FIXED_14 + journey_date + URL_FIXED_15

      # print ultimate_url

      # page = requests.get(ultimate_url)
      # tree = html.fromstring(page.text)

      # temp_car_names = []
      # temp_car_fares = []
      # temp_car_types = []

      # temp_car_names = tree.xpath("//div[@class='large-8 medium-7 small-12 columns small-push-12 col-pad-10']/h5/strong/text()")
      # temp_car_fares = tree.xpath("//div[@class='large-5 medium-6 small-12 columns text-right col-pad-10']/h3/strong/text()")
      # temp_car_types = tree.xpath("//div[@class='large-8 medium-7 small-12 columns small-push-12 col-pad-10']/span/text()")

      # print temp_car_names
      # print temp_car_fares
      # print temp_car_types

      db = MySQLdb.connect("localhost","root","im2gud","pantomath")

      # prepare a cursor object using cursor() method
      cursor = db.cursor()

      # for i in range(0, 3):
      k += 1  
      print "inserting"
      try:
        # cursor.execute("INSERT INTO CabPrices(cab_price) VALUES (%s)", (int(temp_car_fares[i].replace("Rs. ","").replace(",",""))))
        cursor.execute("INSERT INTO CabCities(cab_source, cab_destination) VALUES (%s, %s)", (source_city.replace("+", " "), destination_city.replace("+"," ")))
    # Commit your changes in the database
        db.commit()
      except:
        db.rollback()

db.close()
print 'done'
