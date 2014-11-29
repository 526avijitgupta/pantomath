# http://www.cleartrip.com/buses/search?from=Delhi&to=Lucknow&date=29/11/2014

from lxml import html
import requests
import json
import time
import MySQLdb

# source_city = str(raw_input("Enter the source city:"))
# destination_city = str(raw_input("Enter the destination city:"))
# depart_date = str(raw_input("Enter the date of the journey")).replace("-","/") # 26/11/2014

# run tests on delhi and lucknow separately!

# city_list = ["Bangalore", "Chennai", "Goa", "Mumbai"]

depart_date = "10/12/2014"
URL_FIXED_11 = "http://www.cleartrip.com/buses/search?from="
URL_FIXED_12 = "&to="
URL_FIXED_13 = "&date="

k = 0
for l in range(0,7):  
  source_city = str(raw_input("Enter the name of the source city"))
  destination_city = str(raw_input("Enter the name of the destination city"))

  for t in range(0, 2):
    if (t == 1):
      ultimate_url = URL_FIXED_11 + source_city + URL_FIXED_12 + destination_city + URL_FIXED_13 + depart_date
    else:
      ultimate_url = URL_FIXED_11 + destination_city + URL_FIXED_12 + source_city + URL_FIXED_13 + depart_date


    print ultimate_url
    page = requests.get(ultimate_url)
    data = json.loads(page.text)

    print "Source city:%s , Destination city:%s" % (source_city, destination_city)

    price = [] 
    # typebus = []
    # departure_time = []
    # arrival_time = []

    # x['btd']['1']['cv'][0]['bts']

    for p in range(0,2):
      price += [data['btd'][str(p+1)]['cv'][0]['f'][0]]
      # typebus += [data['btd'][str(k+1)]['cv'][0]['bts']]
      # departure_time += [time.strftime("%H:%M", time.gmtime(int(data['btd'][str(k + 1)]['dt']) / 1000.0))]
      # arrival_time += [time.strftime("%H:%M", time.gmtime(int(data['btd'][str(k + 1)]['at']) / 1000.0))]

    print price
    # print typebus          
    # print departure_time
    # print arrival_time
    # Open database connection

    db = MySQLdb.connect("localhost","root","im2gud","pantomath" )

    # prepare a cursor object using cursor() method
    cursor = db.cursor()

    # for i in range(0, 2):
    #   print "inserting %d of %d" % (i, 2)
    #   try:
    #     cursor.execute("INSERT INTO BusTimes(bus_arr_time, bus_dept_time) VALUES (%s, %s)", (arrival_time[i], departure_time[i]))
    # # Commit your changes in the database
    #     db.commit()
    #   except:
    #     db.rollback()

    for i in range(0, 2):
      k += 1
      print "inserting %d of %d" % (i, 2)
      try:
        # cursor.execute("INSERT INTO BusTimes(bus_arr_time, bus_dept_time) VALUES (%s, %s)", (arrival_time[i], departure_time[i]))
        cursor.execute("update BusTimes set bus_price = (%s) where bus_id = (%s)", (price[i], int(k)))
    # Commit your changes in the database
        db.commit()
      except:
        db.rollback()



db.close()
print 'done'
