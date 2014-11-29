# http://flight.yatra.com/air-service/dom2/airMonthView?&OriginLocationCode=DEL&DestinationLocationCode=BOM&travelClass=Economy&flight_depart_date=2014%2F11%2F26

from lxml import html
import requests
import json
import MySQLdb

# source_city = str(raw_input("Enter the source city:"))
# destination_city = str(raw_input("Enter the destination city:"))
depart_date = "2014,11,30".replace(",", "%2F")
travel_class = "Economy"

city_list = ["Delhi", "Mumbai", "Chennai", "Bangalore", "Goa"]
city_dict = {"Delhi":"DEL", "Mumbai":"BOM", "Chennai":"MAA", "Bangalore":"BLR", "Goa":"GOI"}

for j in range(0, 5):
  for k in range(0, 5):
    if (j != k):
      source_city = city_list[j]
      destination_city = city_list[k]

      depart_dummy = str(city_dict[source_city])

      arrival_dummy = str(city_dict[destination_city])

      URL_FIXED_11 = "http://flight.yatra.com/air-service/dom2/airMonthView?&OriginLocationCode="
      URL_FIXED_12 = "&DestinationLocationCode="
      URL_FIXED_13 = "&travelClass="
      URL_FIXED_14 = "&flight_depart_date=" # 2014,11,26

      ultimate_url = URL_FIXED_11 + depart_dummy + URL_FIXED_12 + arrival_dummy + URL_FIXED_13 + travel_class + URL_FIXED_14 + depart_date

      print ultimate_url

      page = requests.get(ultimate_url)

      data = json.loads(page.text)  

      price = []
      airline_name = []
      departure_time = []
      arrival_time = []

      for i in range(0,3):
        price += [data[0]["mnArr"][i]["cf"][0]["tf"]]
        # airline_name += [data[0]["mnArr"][i]["cf"][0]["yan"]]
        departure_time += [data[0]["mnArr"][i]["cf"][0]["dt"]]
        arrival_time += [data[0]["mnArr"][i]["cf"][0]["at"]]
        
      print price
      # print airline_name
      print departure_time
      print arrival_time


      db = MySQLdb.connect("localhost","root","im2gud","pantomath")

      # prepare a cursor object using cursor() method
      cursor = db.cursor()

      for i in range(0, 3):  
        print "inserting"
        try:
          cursor.execute("INSERT INTO FlightData(flight_arr_time, flight_dept_time, flight_price) VALUES (%s, %s, %s)", (arrival_time[i], departure_time[i], price[i]))
      # Commit your changes in the database
          db.commit()
        except:
          db.rollback()

db.close()
print 'done'