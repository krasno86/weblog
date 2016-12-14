require 'nokogiri'
require 'open-uri'
require 'curb'

ActiveAdmin.register_page 'Parser' do
#   doc = Nokogiri::HTML(open("http://www.juventus.ru/"))
#   puts
# end

curl = Curl::Easy.perform("http://www.juventus.ru/")


end
