require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'httparty'
require 'byebug'

def crypto_market

  url = "https://coinmarketcap.com/all/views/all/"
  unparsed_page = HTTParty.get(url)
  parsed_page = Nokogiri::HTML(unparsed_page)

  cryptos = Array.new(0)

  parsed_page.css(".cmc-table-row").each.with_index do |line, index|
    symbol = line.css(".cmc-table__cell--sort-by__symbol").text
    price = line.css(".cmc-table__cell--sort-by__price").text.gsub("$", "").gsub(",", "").to_f
    cryptos[index] = { symbol => price }

     puts "Cryptos et prix (#{index}) :" + cryptos[index].to_s
  end

  return cryptos
end

  print crypto_market