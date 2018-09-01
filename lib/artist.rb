require 'pry'

class Artist

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
    
  end

  #This method saves all the different artist that have been created into @all
  def save
    @@all << self
  end

  def self.all
    @@all
  end


  #helper method
  def self.create_by_name(artist)
    artist = self.new(artist)
    @@all << artist
    artist
  end

  #helper method
  def self.find_by_name(entry)
    result = self.all.find{|artist| artist.name == entry}
  end

  #Encapuslation of above 2 methods
  def self.find_or_create_by_name(entry)
    result = self.find_by_name(entry)
    if result
      result
    else
      self.create_by_name(entry)
    end
  end

  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end


end
