require 'pry'

class MP3Importer
  attr_accessor :path  
  
  def initialize(file_path)
    @path = file_path
  end 
  
  def files
    file_path = @path + "/*mp3"
    files = Dir[file_path]
    files.collect do |file| 
      file.delete_prefix("./spec/fixtures/mp3s/")
    end 
  end 
  
  def import 
    file_names = self.files 
    file_names.each do |file_name|
      Song.new_by_filename(file_name)
    end 
  end 
  
end 

test_music_path = "./spec/fixtures/mp3s"
MP3Importer.new(test_music_path).files
