
class Song
  attr_reader :id, :name, :artist, :lyrics, :album_id
  attr_accessor :name, :album_id, :artist

  @@songs = {}
  @@total_rows = 0

  def initialize(attributes)
    @name = attributes[:name]
    @artist = attributes[:artist]
    @lyrics = attributes[:lyrics]
    @id = attributes[:id]|| @@total_rows += 1
    @album_id = attributes[:album_id]
  end

  def ==(song_to_compare)
    (self.name() == song_to_compare.name()) && (self.album_id() == song_to_compare.album_id())
  end

  def self.all
    @@songs.values
  end

  def save
    @@songs[self.id] = Song.new({:name => self.name, :artist => self.artist, :lyrics => self.lyrics,  :id => id, :album_id => self.album_id})
  end

  def self.find(id)
    @@songs[id]
  end

  def update(attributes)
    attributes.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end

  def delete
    @@songs.delete(self.id)
  end

  def self.clear
    @@songs = {}
  end

  def self.find_by_album(alb_id)
    songs = []
    @@songs.values.each do |song|
      if song.album_id == alb_id
        songs.push(song)
      end
    end
    songs
  end

  def album
    Album.find(self.album_id)
  end
end
