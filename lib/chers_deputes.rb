require 'nokogiri'
require 'open-uri'

def get_depute_email(depute_url)
    page = Nokogiri::HTML(URI.open(depute_url))
    page.xpath('//*[@id="haut-contenu-page"]/article/div[3]/div/dl/dd[4]/ul/li[2]/a').text
end
  
# ---------------------- extract first name, last name and email --------------------------------
# ---------------------- and build hash first name/ last name / email --------------------------
  
def final_array
    page = Nokogiri::HTML(URI.open("https://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
    url_path = page.xpath('//div[contains(@class, "clearfix col-container")] //a')
    list_first_name = []
    list_last_name = []
    list_url = []
    final_array = []
  
    url_path.each do |depute|
    list_first_name << depute.text.split[1] 
    list_last_name << depute.text.split[2] 
    list_url << depute['href']
    end
  
  
    (0..list_first_name.length - 1).each do |i|
    final_array.push({"first_name"=> list_first_name[i], "last_name"=> list_last_name[i], "email"=> get_depute_email("https://www2.assemblee-nationale.fr/#{list_url[i]}")})
    end
    return final_array
end

print final_array