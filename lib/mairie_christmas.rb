require 'nokogiri'
require 'open-uri'

# -------------------------------    extract the path    -------------------------------------------


def get_townhall_email(townhall_url)
  page = Nokogiri::HTML(URI.open(townhall_url))
  page.xpath('/html/body/div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]').text
end

# ---------------------------  extract emails of the townhall --------------------------------------------------

def get_townhall_urls
  page = Nokogiri::HTML(URI.open('http://annuaire-des-mairies.com/val-d-oise.html'))
  list_of_urls = []
  page.xpath('//a[contains(@class, "lientxt")]').each {|town| list_of_urls.push(town['href'])}

  return list_of_urls
end

# ---------------------------  extract names of the townhall  ---------------------------------

def get_townhall_name
  page = Nokogiri::HTML(URI.open('http://annuaire-des-mairies.com/val-d-oise.html'))
  list_of_towns = []
  page.xpath('//a[contains(@class, "lientxt")]').each {|town| list_of_towns.push(town.text)}
  return list_of_towns
end

# --------------------------- build hash name / url  -----------------------------------------

def create_final_array
  list_of_towns = get_townhall_name
  list_of_urls = get_townhall_urls
  final_array = []

  final_array = list_of_towns.zip(list_of_urls).map { |town, url| {town => get_townhall_email("http://annuaire-des-mairies.com/#{url}")} }
  return final_array
end

print create_final_array