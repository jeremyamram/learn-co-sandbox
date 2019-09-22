class Song
  attr_accessor :artist, :name, :genre
  
 @@all = []
 
  def initialize(name, genre)
    @name = name
    @genre = genre
    save
  end
  
  def save
    @@all << self
  end
  
  def artist_name
    self.artist.name
  end
  
  def self.all
    @@all
  end
end

class Artist
  attr_accessor :name
 
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def add_song(song)
     @songs << song
     song.artist = self
  end
  
  def add_song_by_name (name, genre)
    song = Song.new (name, genre)
    add_song(song)
  end
  
  def songs
    Song.all.select {|song| song.artist == self}
  end
end