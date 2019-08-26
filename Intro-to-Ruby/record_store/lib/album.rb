
class Album
  attr_reader :id, :name, :artist, :year, :genre, :length
  attr_accessor :name
  @@albums = {}
  @@total_rows = 0
  @@sold_albums = {}

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @artist = attributes.fetch(:artist)
    @year = attributes.fetch(:year)
    @genre = attributes.fetch(:genre)
    @length = attributes.fetch(:length)
    @id = attributes.fetch(:id)
  end

  def self.all
    @@albums.values.sort_by(&:name)
  end

  def self.all_sold
    @@sold_albums.values.sort_by(&:name)
  end

  def save
    @@albums[self.id] = Album.new({:name => self.name, :artist => self.artist, :year => self.year, :genre => self.genre, :length => self.length,  :id => @@total_rows += 1})
  end

  def ==(album_to_compare)
    self.name() == album_to_compare.name()
  end

  def self.clear
    @@albums = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@albums[id]
  end

  def self.search(name)
    @@albums.values.select{|a| a.name == name}
  end
  
  def update(attributes)
    self.name = attributes
    @@albums[self.id] = Album.new({:name => self.name, :artist => self.artist, :year => self.year, :genre => self.genre, :length => self.length,  :id => @@total_rows += 1})
  end

  def delete
    @@albums.delete(self.id)
  end

  def sold()
    @@sold_albums[:name] = @@albums.delete(:name)
  end

  def songs
    Song.find_by_album({:name => self.name, :artist => self.artist, :year => self.year, :genre => self.genre, :length => self.length,  :id => @@total_rows += 1})
  end
end
