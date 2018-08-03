class Scraper
  def self.scrape_site(input)
    link = input.gsub(" ", "-")

    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    driver = Selenium::WebDriver.for :chrome, options: options
    driver.get "http://www.bigstub.com/#{link}-tickets.aspx"

    begin
      wait = Selenium::WebDriver::Wait.new(:timeout => 5)
      wait.until { /title-holder/.match(driver.page_source) }
    rescue Selenium::WebDriver::Error::TimeOutError
      return nil
    end

    doc = Nokogiri::HTML(driver.page_source)
    driver.quit

    concerts = []
    doc.css("div#upcomingEventsList div.item2").each do |info|
      artist = info.css('div.title-holder h3 a').text
      venue = info.css('div.title-holder strong.title').text
      date = info.css('div.ueDate span.midline1').text

      concerts << {
      input: input,
      artist: Artist.find_or_create_by_name(artist),
      venue: Venue.find_or_create_by_name(venue),
      date: date
    }

    # Venue.find_or_create_by_name(venue).add_date(date)
    end
    concerts
  end

end
