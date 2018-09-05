class Song
  attr_accessor :name, :artist
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end


  def self.new_by_filename(filename)
    song_data = MP3Importer.extract_metadata(filename)

    song = Song.new(song_data[:title])
    artist = Artist.find_or_create_by_name(song_data[:artist])
    song.artist = artist

    song
  end
end
