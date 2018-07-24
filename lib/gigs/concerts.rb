class Concerts
  attr_accessor :artist, :venue, :date
  @@all = []

  def initialize(data)
    data.each { |key, value| self.send(("#{key}="),value) }
    @@all << self
  end

  def self.print_concerts
    @@all.each do |data|
      puts "==============================================="
      puts "Artist: #{data.artist}"
      puts "Venue: #{data.venue}"
      puts "Date: #{data.date}"
      puts "This is working"
    end
  end

end
