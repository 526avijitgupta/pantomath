# http://www.cleartrip.com/flights/calendar/calendarstub.json?from=DEL&to=BOM&start_date=20141101&end_date=20141130

from lxml import html
import requests
import json

source_city = str(raw_input("Enter the source city:"))
destination_city = str(raw_input("Enter the destination city:"))
depart_date = str(raw_input("Enter the date of the journey")).replace("-","")
arrival_date = str(raw_input("Enter the date of the journey")).replace("-","")

city_dummy_dict = { 'Delhi':'DEL' , 'Bangalore':'BLR' , 'Chennai':'MAA' ,'Kolkata':36 , 'Mumbai':114 , 'Hyderabad':145 , 'Lucknow':145 , 'Dehradun':145 , 'Agra':145 , 'Jaipur':145 , 'Guwahati':145 , 'Ahemdabad':145 , 'Mysore':145 , 'Goa':145 , 'Amritsar':145 , 'Khajuraho':145 }

depart_dummy = str(city_dummy_dict[source_city])

arrival_dummy = str(city_dummy_dict[destination_city])

URL_FIXED_11 = "http://www.cleartrip.com/flights/calendar/calendarstub.json?from="
URL_FIXED_12 = "&to="
URL_FIXED_13 = "&start_date="
URL_FIXED_14 = "&end_date=" # 17-11-2014

ultimate_url = URL_FIXED_11 + depart_dummy + URL_FIXED_12 + arrival_dummy + URL_FIXED_13 + depart_date + URL_FIXED_14 + arrival_date

print ultimate_url
#pdb.set_trace()
page = requests.get(ultimate_url)
print page
data = json.loads(page.text)
# tree = html.fromstring(page.text)

# data = json.loads(tree)

print data

price = []

for i in range(len(data['calendar_json'][depart_date])):
	price += [data['calendar_json'][depart_date][i]['pr'].replace('u','')]

for i in range(len(data['calendar_json'][arrival_date])):
	price += [data['calendar_json'][arrival_date][i]['pr'].replace('u','')]

print price
