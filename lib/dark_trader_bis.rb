require 'rubygems'
require 'nokogiri'
require 'open-uri'


def dark_trader
    page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))

    puts "Début de la récupération des noms des cryptos"
    all_names_arr = []
    page.css('a.cmc-table__column-name--symbol').each do |name|
        all_names = name.text
        all_names_arr = all_names_arr.push(all_names)
    end
    puts all_names_arr
    puts "Fin de la récupération des noms des cryptos"

    puts "Début de la récupération des valeurs des cryptos"
    all_values_arr = []
    page.css('div.sc-131di3y-0 a.cmc-link span').each do |value|
        all_values = value.text.delete('$,').to_f
        all_values_arr = all_values_arr.push(all_values)
    end
    puts all_values_arr
    puts "Fin de la récupération des valeurs des cryptos"

    hash_crypto = []
    all_names_arr.each_with_index {|k, i| hash_crypto << {k => all_values_arr[i]}}
    print hash_crypto
    return hash_crypto
end

dark_trader