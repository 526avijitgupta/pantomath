# My first program primarily coded in emacs!
# This python script web scraps the details of the cab services available(car-type, car-fare) for the cities added to the dict

from lxml import html
import requests

# http://www.redbus.in/Booking/SelectBus.aspx?fromCityId=733&toCityId=551&doj=23-Nov-2014&busType=Any&opId=0&doj1=25-Nov-2014

from_city = str(raw_input("Enter the source city!"))
to_city = str(raw_input("Enter the destination city!"))
date_journey = str(raw_input("Enter the date of the journey!"))

URL_FIXED_11 = "http://www.redbus.in/Booking/SelectBus.aspx?fromCityId="
URL_FIXED_12 = "&toCityId="
URL_FIXED_13 = "&doj="
URL_FIXED_14 = "&busType=Any&opId=0"

city_ids = { "Delhi":"733" , "Bangalore":"122" , "Kolkata":"74820" , "Mumbai":"462" }

from_city = city_ids[from_city]
to_city = city_ids[to_city]
 
ultimate_url = URL_FIXED_11 + from_city + URL_FIXED_12 + to_city + URL_FIXED_13 + date_journey + URL_FIXED_14 

page = requests.get(ultimate_url)
tree = html.fromstring(page.text)

bus_names = []
bus_fares = []
bus_types = []

bus_names = tree.xpath("//*[@id='onwardTrip']/ul/li[1]/li[1]/div/div[3]/h4/text()")
bus_fares = tree.xpath("//*[@id='onwardTrip']/ul/li[1]/li[1]/div/div[9]/span/span/text()")
bus_types = tree.xpath("//*[@id='onwardTrip']/ul/li[1]/li[1]/div/div[3]/span/text()")

print bus_names
print bus_fares
print bus_types
