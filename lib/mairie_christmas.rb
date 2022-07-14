require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_townhall_email(townhall_url)
    page = Nokogiri::HTML(URI.open(townhall_url))

    city_name = page.xpath('/html/body/div/main/section[1]/div/div/div/h1').text.delete('- 0123456789')
    email = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text

    couple_city_email = {city_name => email}
    puts couple_city_email
end

def get_townhall_urls
    page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))

    all_urls_arr = []
    list_cities = page.css('a.lientxt').each do |url|
        all_urls = url['href'].delete_prefix(".")
        all_urls = "http://annuaire-des-mairies.com#{all_urls}"
        all_urls_arr = all_urls_arr.push(all_urls)
    end
    puts all_urls_arr
end

def perform
    get_townhall_email(get_townhall_urls)
end

perform