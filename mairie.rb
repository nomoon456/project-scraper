require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_all_the_urls_of_val_doise_townhalls
page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))  
array = []
x = 0
page.css("a.lientxt").each do |n|
	array[x] = "http://annuaire-des-mairies.com" + n["href"][1..-1]
    x += 1
end
return array
end

def get_the_email_of_a_townhal_from_its_webpage
page_vaureal = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/vaureal.html"))
page_vaureal.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |j|
	return j.content
end
end

def get_all_email_of_val_doise_townhalls(array)
y = 0
array_email = []
185.times do |n|
page_email = Nokogiri::HTML(open(array[n]))
	page_email.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |j|
		array_email[y] = j.content
		y += 1
	end
end
return array_email
end

def get_all_name
page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
array_name = []
x = 0
page.css("a.lientxt").each do |n|
	array_name[x] = n.text
x += 1
end
return array_name
end

array = get_all_the_urls_of_val_doise_townhalls()
get_name = get_all_name
get_email = get_all_email_of_val_doise_townhalls(array)
i = 0
while i != 6
	puts "Que veux tu afficher ?"
	puts "1. L'email de la mairie de Vauréal ?"
	puts "2. Toute les urls des mairies du val d'oise ?"
	puts "3. Les noms de toutes les mairies du val d'oise ?"
	puts "4. Les emails de toutes les mairies du val d'oise ?"
	puts "5. Le bonus qui était je te le rapelle le hash ?"
	puts "6. Exit"
	i = gets.chomp.to_i
	if i == 1
		puts get_the_email_of_a_townhal_from_its_webpage
	elsif i == 2
		puts get_all_the_urls_of_val_doise_townhalls
	elsif i == 3
		puts get_all_name
	elsif i == 4
		puts get_all_email_of_val_doise_townhalls(array)
	elsif i == 5
		h = Hash[get_name.zip get_email]
		puts h
	elsif i == 6
		exit(true)
	end
end
