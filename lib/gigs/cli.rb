class Gigs::CLI

  def run
    welcome
    scrape_data
    goodbye
  end

  def welcome
    puts <<~HEREDOC
      =======================================================================================
      Welcome to Gigs! The CLI gem where you can find out if your favorite artist is touring!
      Please type in a band, artist or DJ's name to find out where they're touring.
      Which artist are you interested in seeing?
    HEREDOC

  end

  def scrape_data
    puts "Enter any artist:"
    input = gets.chomp
    concerts = Scraper.scrape_site(input)
    create_concert_obj(concerts)
    Concerts.print_concerts
  end

  def create_concert_obj(data)
    data.each do |data|
      Concerts.new(data)
    end
  end

  def goodbye
    "Thank you for using Gigs! We hope to see yoy again!"
  end
end
