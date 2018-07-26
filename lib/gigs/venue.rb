require_relative 'concerns/findable'

class Venue
  include Concerns::InstanceMethods
  extend Concerns::ClassMethods
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :dates

  @@all = []

  def initialize(name)
    super(name)
    @dates = []

  end

  def add_date(date)
    @dates << date unless @dates.detect { |saved_dates| saved_dates == date }
  end

  def add_artist(artist)
    @artist = artist if artist == nil
    artist.add_venue(self)
  end

end
