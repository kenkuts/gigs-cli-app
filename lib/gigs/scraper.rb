require 'selenium-webdriver'
require 'nokogiri'
require 'pry'

class Scraper
  def self.scrape_site(band)
    band.gsub!(" ", "-")
    band_page = "http://www.bigstub.com/#{band}-tickets.aspx"
    driver = Selenium::WebDriver.for :chrome
    driver.get band_page
    wait = Selenium::WebDriver::Wait.new(:timeout => 5)

    wait.until {
    /title-holder/.match(driver.page_source)
    }

    doc = Nokogiri::HTML(driver.page_source)

    doc.css("div#upcomingEventsList div.item2").each do |info|
      puts "======================================================================"
      puts "Artist: #{info.css('div.title-holder h3 a').text}"
      puts "Venue: #{info.css('div.title-holder strong.title').text}"
      puts "Date: #{info.css('div.ueDate span.midline1').text}"
    end
    driver.quit
  end
end

puts "What band?"
input = gets.chomp
Scraper.scrape_site(input)
