
class Song
  attr_reader :id, :name, :artist, :lyrics, :album_id
  attr_accessor :name, :album_id, :artist

  @@songs = {}
  @@total_rows = 0

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @artist = attributes.fetch(:artist)
    @lyrics = attributes.fetch(:lyrics)
    @id = attributes.fetch(:id)
    @album_id = attributes.fetch(:album_id)
  end

  def ==(song_to_compare)
    (self.name() == song_to_compare.name()) && (self.album_id() == song_to_compare.album_id())
  end

  def self.all
    @@songs.values
  end

  def save
    @@songs[self.id] = Song.new({:name => self.name, :artist => self.artist, :lyrics => self.lyrics,  :id => @@total_rows += 1, :album_id => self.album_id})
  end

  def self.find(id)
    @@songs[id]
  end

  def update(new_attributes)
    @@songs[self.id] = Song.new(new_attributes)
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
    Album.find(self.id)
  end
end
