require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  def self.scrape_site(band)
    band.gsub!(" ", "-")

    doc = Nokogiri::HTML(open("http://www.bigstub.com/#{band}-tickets.aspx"))
    doc.css("div#upcomingEventsList div.item2").each do |info|
      puts "Artist: #{info.css("div.item-body div.title-holder h3 a").text}"
      puts "Venue: #{info.css("div.item-body div.title-holder strong.title").text}"
      puts "Time: #{info.css("div.ueDate").text.strip}"
      puts "Date: #{info.css("div.ueDate span.midline1").text}"
      puts "======================================================================"
    end
  end
end

puts "What band?"
input = gets.chomp
Scraper.scrape_site(input)
