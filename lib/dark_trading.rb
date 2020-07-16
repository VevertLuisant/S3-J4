require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/Factorial"))   
puts page.css ('div')  # => Nokogiri::HTML::Document