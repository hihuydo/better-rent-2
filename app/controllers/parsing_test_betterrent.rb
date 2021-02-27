require 'open-uri'
require 'nokogiri'

document = Nokogiri::HTML.parse(open("https://www.immowelt.de/expose/2yegd4g", 'user-agent' => 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.75 Safari/537.36', 'accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9'))
      price = document.css("div.hardfact").text.to_f
      location = document.css("div.location span.no_s").text
      place = location.split
      place.each do |loc|
        puts loc
      end
