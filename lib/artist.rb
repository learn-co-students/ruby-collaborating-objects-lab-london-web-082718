class Artist

  attr_accessor :name

  @@all = []

  def initialize(name)
    if !Artist.find(name)
      @name = name
    else
      @name = "[COPY] " + name
      puts "WARNING: Artist name already exists in database. Creating second entry marked [COPY]"
    end
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

  def self.find(name)
    Artist.all.find { |artist| artist.name == name }
  end

  def self.find_or_create_by_name(name)
    find(name) || Artist.new(name)
  end

  def self.all
    @@all
  end

end
