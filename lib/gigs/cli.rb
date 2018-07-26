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
      Please type in an artist, band or DJ's name to find out where they're touring.
      To quit program just type 'exit' then press enter. Which artist are you interested in seeing?
      =======================================================================================
    HEREDOC
    .colorize(:cyan)
  end

  def scrape_data
    puts "Enter any artist, band or DJ:".colorize(:cyan)
    input = gets.chomp

    goodbye if input == "exit"
    concerts = Scraper.scrape_site(input)
    create_concert_obj(concerts)
    Concerts.print_concerts
    after_initial_artist
  end

  def create_concert_obj(data)
    data.each do |data|
      Concerts.new(data)
    end
  end

  def after_initial_artist
    puts "What would you like to do next?".colorize(:cyan)
    puts "To find another artist type 'artist'".colorize(:cyan)
    puts "To look up past searches type 'list'".colorize(:cyan)
    puts "To quit type 'exit'".colorize(:cyan)
    input = gets.chomp

    case input
    when 'artist'
      scrape_data
    when 'list'
      list
    when 'exit'
      goodbye
    else
      puts "Please make a valid selection".colorize(:red)
      after_initial_artist
    end

  end

  def list
    puts "=============Past Searches============="
    Artist.display_artists.each { |artist| puts artist.colorize(:red) }

  end

  def goodbye
    puts "Thank you for using Gigs! We hope to see you again!".colorize(:cyan)
    exit
  end

end
