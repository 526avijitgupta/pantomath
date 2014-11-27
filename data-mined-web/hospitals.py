# http://en.wikipedia.org/wiki/List_of_hospitals_in_India

# //*[@id="NavFrame" + val + ""]/div[3]/ul/li/a/text()

# 28 - Chandigarh

from lxml import html
import requests

city = str(raw_input("Enter the name of the city"))

ultimate_url = "http://en.wikipedia.org/wiki/List_of_hospitals_in_India"

page = requests.get(ultimate_url)
tree = html.fromstring(page.text)

hospital_names = []

city_dict = { 'Bengaluru':55 , 'Delhi':31 , 'Mumbai':31 , 'Kolkata':31 , 'Chennai':31 }

# xpath = '//*[@id="NavFrame' + str(city_dict[city]) + '"]/div[3]/ul/li[1]/a/text()'
xpath = '//a[contains(@href,"' + city + '")]/text()'

print xpath

hospital_names = tree.xpath(xpath)

print hospital_names
