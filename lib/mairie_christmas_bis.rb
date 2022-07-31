require 'nokogiri'
require 'open-uri'

def get_townhall_email(townhall_url)
  page = Nokogiri::HTML(URI.open(townhall_url))
  page.xpath('/html/body/div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]').text
end
 
def get_townhall_urls
  page = Nokogiri::HTML(URI.open('http://annuaire-des-mairies.com/val-d-oise.html'))
  list_of_urls = []
  page.xpath('//a[contains(@class, "lientxt")]').each do |town|
    list_of_urls << town['href']
  end
  return list_of_urls
end

def get_townhall_name
  page = Nokogiri::HTML(URI.open('http://annuaire-des-mairies.com/val-d-oise.html'))
  list_of_towns = []
  page.xpath('//a[contains(@class, "lientxt")]').each do |town|
  list_of_towns << town.text
  end
  return list_of_towns
end

def create_final_array
  list_of_towns = get_townhall_name
  list_of_urls = get_townhall_urls
  final_array = []
  number_of_town = list_of_towns.length - 1

  for i in 0..number_of_town 
    townhall_url = list_of_urls[i].sub('.', 'http://annuaire-des-mairies.com')
    final_array << {list_of_towns[i]=> get_townhall_email(townhall_url)}
  end
  return final_array
end

print create_final_array