require 'pry'

class MP3Importer

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def self.extract_metadata(filename)
    artist_name = filename.split('-')[0].strip()
    song_name = filename.split('-')[1].strip()
    {
      "artist": artist_name,
      "title": song_name
    }
  end

  def files
    Dir.entries(@path).select {|file| file[-3..-1] == 'mp3'}
  end

  def import
    files.each {|filename| Song.new_by_filename(filename)}
  end
end
