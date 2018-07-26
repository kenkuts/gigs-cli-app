class Concerts
  attr_accessor :artist, :venue, :date
  @@all = []

  def initialize(data)
    data.each { |key, value| self.send(("#{key}="),value) }
    @@all << self
  end

  def self.print_concerts
    @@all.each do |data|
      puts "===================================================".colorize(:color => :cyan)
      puts "Artist: #{data.artist.name}".colorize(:red)
      puts "Venue: #{data.venue.name}".colorize(:white)
      puts "Date: #{data.date}".colorize(:blue)
    end
      puts "===================================================".colorize(:color => :cyan)
  end

end
