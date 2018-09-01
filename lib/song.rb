

class Song

  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def artist_name=(artist_name)
    self.artist.name = artist_name
  end

  def self.new_by_filename(filename)
    song_name = filename.split(" - ")
    song = self.new(song_name[1])
    # song.artist = song_name[0]

  end

end
