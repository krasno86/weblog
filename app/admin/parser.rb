require 'nokogiri'
require 'open-uri'

ActiveAdmin.register_page 'Parser' do
  doc = Nokogiri::HTML(open("http://www.juventus.ru/"))
end