require 'pry'

class MP3Importer

  attr_accessor :path

  def initialize(path)
    @path = path
  end



  #creates a list of file names from the directory saved path
  def files
    # list_of_filenames = Dir.entries(path)
    @list_of_filenames = Dir.glob("#{@path}/*.mp3").collect! {|x| x.gsub("#{@path}/", "") }
    # binding.pry
  end


  #
  def import
    #Question, why doesn't @list_of_filenames work on the iteration but instead the method?
    files.each{ |filename| Song.new_by_filename(filename) }
  end

end
