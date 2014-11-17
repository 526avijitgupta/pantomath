# My first program primarily coded in emacs!
# This python script web scraps the details of the cab services available(car-type, car-fare) for the cities added to the dict

from lxml import html
import requests

source_city = str(raw_input("Enter the source city:")).replace(" ","+")
destination_city = str(raw_input("Enter the destination city:")).replace(" ","+")
journey_date = str(raw_input("Enter the date of the journey"))

city_dummy_dict = { 'New+Delhi':145 , 'Bangalore':377 , 'Kolkata':36 , 'Mumbai':114 , 'Hyderabad':145 , 'Pondicherry':145 , 'Lucknow':145 , 'Dehradun':145 , 'Agra':145 , 'Pune':145 , 'Jaipur':145 , 'Guwahati':145 , 'Ahemdabad':145 , 'Gurgaon':145 , 'Mysore':145 , 'Goa':145 , 'Amritsar':145 , 'Khajuraho':145 , 'Chandigarh':145 }

city_dummy = str(city_dummy_dict[source_city])

URL_FIXED_11 = "http://www.savaari.com/select_cars.php?from_city="
URL_FIXED_12 = "&from_city_dummy="
URL_FIXED_13 = "&to_city="
URL_FIXED_14 = "&pickup_date=" # 17-11-2014
URL_FIXED_15 = "&duration=1&trip_type=3"

ultimate_url = URL_FIXED_11 + source_city + URL_FIXED_12 + city_dummy + URL_FIXED_13 + destination_city + URL_FIXED_14 + journey_date + URL_FIXED_15

print ultimate_url

page = requests.get(ultimate_url)
tree = html.fromstring(page.text)

temp_car_names = []
temp_car_fares = []
temp_car_types = []

temp_car_names = tree.xpath("//div[@class='large-8 medium-7 small-12 columns small-push-12 col-pad-10']/h5/strong/text()")
temp_car_fares = tree.xpath("//div[@class='large-5 medium-6 small-12 columns text-right col-pad-10']/h3/strong/text()")
temp_car_types = tree.xpath("//div[@class='large-8 medium-7 small-12 columns small-push-12 col-pad-10']/span/text()")

print temp_car_names
print temp_car_fares
print temp_car_types

