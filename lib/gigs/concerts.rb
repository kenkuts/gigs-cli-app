class Concerts
  extend Concerns::ClassMethods
  extend Concerns::Findable

  attr_accessor :input, :artist, :venue, :date
  @@all = []

  def initialize(data)
    data.each { |key, value| self.send(("#{key}="),value) }
    @@all << self
  end

  def self.print_concerts(artist)
    all.each do |data|
      if data.input.casecmp?(artist)
        puts "===================================================".colorize(:color => :cyan)
        puts "Artist: #{data.artist.name}".colorize(:red)
        puts "Venue: #{data.venue.name}".colorize(:white)
        puts "Date: #{data.date}".colorize(:blue)
      end
    end
    puts "===================================================".colorize(:color => :cyan)
  end

  def self.print_past_searches
    all.map { |name| name.input.split.map(&:capitalize).join(" ") }.uniq
  end

  def self.create_concert_obj(data)
    data.each do |data|
      Concerts.new(data)
    end
  end

end
