require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    self.all << song
    song
  end
  
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end
  
  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end
  
  def self.find_by_name(song_name)
    self.all.detect { |song| song.name == song_name }
  end
  
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end
  
  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end
  
  def self.new_from_filename(file)
    song = self.new
    song.name = file.split(" - ")[1].chomp(".mp3")
    song.artist_name = file.split(" - ")[0]
    song
  end
  
  def self.create_from_filename(file)
    song = self.create
    song.name = file.split(" - ")[1].chomp(".mp3")
    song.artist_name = file.split(" - ")[0]
    song
    
    # artist, song = file.split(" - ")
    # song_name = song.gsub(".mp3", "")
    # new_song = self.new
    # new_song.name = song_name
    # new_song.artist_name = artist
    # new_song
  end
  
  def self.destroy_all
    self.all.clear
  end
end
