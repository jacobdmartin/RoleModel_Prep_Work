class Album
  attr_reader :id, :name
  attr_accessor :name
  @@albums = {}
  @@total_rows = 0
  @@sold_albums = {}

  def initialize(name, id)
    @name = name
    @id = id || @@total_rows += 1
  end

  def self.all
    @@albums.values.sort_by(&:name)
  end

  def self.all_sold
    @@sold_albums.values.sort_by(&:name)
  end

  def save
    @@albums[self.id] = Album.new(self.name, self.id)
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
  def update(name)
    self.name = name
    @@albums[self.id] = Album.new(self.name, self.id)
  end

  def delete
    @@albums.delete(self.id)
  end

  def sold()
    @@sold_albums[:name] = @@albums.delete(:name)
  end

  def songs
    Song.find_by_album(self.id)
  end
end
