
class Album
  attr_reader :id, :name, :artist, :year, :genre, :length
  attr_accessor :id, :name
  @@albums = {}
  @@total_rows = 0
  @@sold_albums = {}

  def initialize(attributes)
    @name = attributes[:name]
    @artist = attributes[:artist]
    @year = attributes[:year]
    @genre = attributes[:genre]
    @length = attributes[:length]
    @id = attributes[:id] || @@total_rows += 1
  end

  def self.all
    @@albums.values.sort_by(&:name)
  end

  def save
    @@albums[self.id] = Album.new({:name => self.name, :artist => self.artist, :year => self.year, :genre => self.genre, :length => self.length,  :id => id})
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
    attributes.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end

  def delete
    @@albums.delete(self.id)
  end

  def songs
    Song.find_by_album(self.id)
  end

  def sell
    @@sold_albums[self.id] = @@albums.delete(self.id)
  end

  def self.all_sold
    @@sold_albums.values.sort_by(&:name)
  end

  def save_sold
    @@sold_albums[self.id] = Album.new({:name => self.name, :artist => self.artist, :year => self.year, :genre => self.genre, :length => self.length,  :id => id})
  end

  def self.find_sold(id)
    @@sold_albums[id]
  end

  def self.search_sold(name)
    @@sold_albums.values.select{|a| a.name == name}
  end
  
  def update_sold(attributes)
    attributes.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end

  def delete_sold
    @@sold_albums.delete(self.id)
  end
end
