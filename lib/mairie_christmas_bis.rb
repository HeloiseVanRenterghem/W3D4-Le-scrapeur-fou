require 'rubygems'
require 'nokogiri'
require 'open-uri'

def mairie_christmas
    page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))

    puts "Début de la récupération des URLs"
    all_urls_arr = []
    list_cities = page.css('a.lientxt').each do |url|
        all_urls = url['href'].delete_prefix(".")
        all_urls = "http://annuaire-des-mairies.com#{all_urls}"
        all_urls_arr = all_urls_arr.push(all_urls)
    end
    puts all_urls_arr
    puts "Fin de la récupération des URLs"
        
    page = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/95/avernes.html"))

    city_name = page.xpath('/html/body/div/main/section[1]/div/div/div/h1').text.delete('- 0123456789')
    email = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text

    hash_city_email = {city_name => email}
    puts hash_city_email
    return hash_city_email
end

mairie_christmas