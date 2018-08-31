class Artist

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    Artist.all << self
  end

  def save
    Artist.all << self
  end

  def print_songs
    self.songs.each { |song| puts song.name }
  end

  def add_song(song)
    @songs << song
  end

  def songs
    @songs
  end

  def self.find_or_create_by_name(name)
    Artist.all.find { |artist| artist.name == name } || Artist.new(name)
  end

  def self.all
    @@all
  end

end
