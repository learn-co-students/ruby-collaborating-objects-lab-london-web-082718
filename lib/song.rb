require 'pry'

class Song

  @@all = []

  attr_accessor :name
  attr_reader :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    details = filename.split(" - ")
    artist_name = details[0]
    song_name = details[1]
    new_song = self.new(song_name)
    new_song.artist = Artist.find_or_create_by_name(artist_name)
    new_song.artist.songs << new_song
    new_song
  end

  def artist=(artist_object)
    @artist = Artist.find_or_create_by_name(artist_object.name)
  end

  def self.all
    @@all
  end

end
