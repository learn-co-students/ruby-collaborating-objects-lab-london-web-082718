class MP3Importer

  attr_reader :path

  def initialize(file_path)
    @path = file_path
  end

  def files
    @files = Dir["#{@path}/*.mp3"].map { |filename| filename[(path.length+1)..-1] }
  end

  def import
    files.each { |file| Song.new_by_filename(file) }
  end

end
