require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

i = 1
while i == 1
	Time.new	
	value_array = []
	x = 0
	page.css("a.price").each do |n|
		value_array[x] = n["data-usd"]
		x += 1
	end
	currency_array = []
	y = 0
	page.css("a.currency-name-container").each do |k|
		currency_array[y] = k.content
		y += 1
	end
	h = Hash[currency_array.zip value_array]
	puts h
	sleep 3600
end
