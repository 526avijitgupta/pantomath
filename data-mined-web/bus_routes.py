import MySQLdb

db = MySQLdb.connect("localhost","root","im2gud","pantomath" )

k = 0
cursor = db.cursor()
for i in range(0, 28):
  k = i + 1
  # if(i%3 == 0):
  #   k += 1
  # # source_city = str(raw_input())
  # destination_city = str(raw_input())

  # cursor.execute("INSERT INTO BusCities(bus_source, bus_destination) VALUES (%s, %s)", (source_city, destination_city))
  # cursor.execute("INSERT INTO BusCities(bus_source, bus_destination) VALUES (%s, %s)", (destination_city, source_city))
  # cursor.execute("INSERT INTO FlightRoutes(route_id) VALUES (%s)", (int(k)))
  
  cursor.execute("update BusTimes set bus_price = (%s) where bus_id = (%s)", (int(k)))



# Commit your changes in the database
  db.commit()
# Rollback in case there is any error
  # db.rollback()
db.close()
print 'done'
