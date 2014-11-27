# http://www.cleartrip.com/buses/search?from=Delhi&to=Lucknow&date=29/11/2014

from lxml import html
import requests
import json

source_city = str(raw_input("Enter the source city:"))
destination_city = str(raw_input("Enter the destination city:"))
depart_date = str(raw_input("Enter the date of the journey")).replace("-","/") # 26/11/2014

URL_FIXED_11 = "http://www.cleartrip.com/buses/search?from="
URL_FIXED_12 = "&to="
URL_FIXED_13 = "&date="

ultimate_url = URL_FIXED_11 + source_city + URL_FIXED_12 + destination_city + URL_FIXED_13 + depart_date

print ultimate_url
#pdb.set_trace()
page = requests.get(ultimate_url)
print page
data = json.loads(page.text)
# tree = html.fromstring(page.text)

# data = json.loads(tree)

print data

price = []
typebus = []

# x['btd']['1']['cv'][0]['bts']

for i in range(0,5):
	price += [data['btd'][str(i+1)]['cv'][0]['f']]
	typebus += [data['btd'][str(i+1)]['cv'][0]['bts']]

print price
print data
