# http://railways.makemytrip.com/railways/json/results?classCode=SL&date=11/26/2014&destCity=Bangalore&srcCity=Delhi

from lxml import html
import requests
import json

source_city = str(raw_input("Enter the source city:"))
destination_city = str(raw_input("Enter the destination city:"))
depart_date = str(raw_input("Enter the date of the journey")).replace("-","/") # 26/11/2014
depart_class = str(raw_input("Enter the class of the journey")) # SL

URL_FIXED_11 = "http://railways.makemytrip.com/railways/json/results?classCode="
URL_FIXED_12 = "&date="
URL_FIXED_13 = "&destCity="
URL_FIXED_14 = "&srcCity=" # 17-11-2014

ultimate_url = URL_FIXED_11 + depart_class + URL_FIXED_12 + depart_date + URL_FIXED_13 + destination_city + URL_FIXED_14 + source_city

print ultimate_url
#pdb.set_trace()
page = requests.get(ultimate_url)
print page
data = json.loads(page.text)
# tree = html.fromstring(page.text)

# data = json.loads(tree)

print data

price = []

for i in range(len(data['searchResponse']['results'])):
	price += [data['searchResponse']['results'][i]['productFares'][0]['trainFare']['totalAmount']]

print price
