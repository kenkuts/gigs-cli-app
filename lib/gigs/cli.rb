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

    while concerts == nil
      puts "Unfortunately #{input} doesn't have any gigs lined up.".colorize(:red)
      puts "Please enter another artist".colorize(:red)
      scrape_data
    end

    Concerts.create_concert_obj(concerts)
    puts "===================#{input.split.map(&:capitalize).join(" ")}'s Gigs===================".colorize(:cyan)
    Concerts.print_concerts(input)
    after_initial_artist
  end

  def after_initial_artist
    puts "What would you like to do next?".colorize(:cyan)
    puts "To find another artist, band or DJ type 'search'".colorize(:cyan)
    puts "To look up past searches type 'list'".colorize(:cyan)
    puts "To quit type 'exit'".colorize(:cyan)
    input = gets.chomp

    case input
    when 'search'
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
    puts "===================Past Searches===================".colorize(:cyan)
    Concerts.print_past_searches.each { |artist| puts artist.colorize(:red) }
    puts "Which of these past searches would you like to look at?".colorize(:cyan)
    input = gets.chomp
    goodbye if input == "exit"

    unless Concerts.print_past_searches.any? { |artist| artist.casecmp?(input)}
      puts "===================================================".colorize(:cyan)
      puts "Please make a valid selection".colorize(:red)
      list
    else
      puts "===================#{input.split.map(&:capitalize).join(" ")}'s Gigs===================".colorize(:cyan)
      Concerts.print_concerts(input)
    end

    after_initial_artist
  end

  def goodbye
    puts "Thank you for using Gigs! We hope to see you again!".colorize(:cyan)
    exit
  end

end
