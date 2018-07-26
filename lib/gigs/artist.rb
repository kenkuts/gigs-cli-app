require_relative 'concerns/findable'

class Artist
  include Concerns::InstanceMethods
  extend Concerns::ClassMethods
  extend Concerns::Findable
  attr_accessor :name, :venues

  @@all = []

  def initialize(name)
    super(name)
    @venues = []
  end

  def add_venue(venue)
    @venues << venue unless @venues.any?(venue)

  end

  def self.display_artists
    all.collect { |artists| artists.name }
  end

end
