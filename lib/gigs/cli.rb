class Gigs::CLI

  def call
    list_tour_dates
    more_info
    goodbye
  end

  def list_tour_dates
    puts <<~HEREDOC
      =======================================================================================
      Welcome to Gigs! The CLI gem where you can find out if your favorite artist is touring!
      Please type in a band, artist or DJ's name to find out where they're touring.
      Which artist are you interested in seeing?
    HEREDOC
    puts "This would print out a list of venues the band will go to. It will also ask the user if s/he wants"
    print "to get more info. More info will consit of dates and times"
  end

  def more_info
    "Enter the number of the venue where you would like more info on:"
  end

  def goodbye
    "Thank you for using Gigs! We hope to see yoy again!"
  end
end
