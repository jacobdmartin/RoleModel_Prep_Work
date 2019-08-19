class Song
  attr_reader :id, :name
  attr_accessor :name
  @@songs = {}
  @@total_rows = 0

  def initialize(name, id)
    @name = name
    @id = id || @@total_rows += 1
  end

  def self.all
    @@songs.values()
  end

  def save
    @@songs[self.id] = Song.new(self.name, self.id)
  end

  def ==(song_to_compare)
    self.name() == song_to_compare.name()
  end

  def self.clear
    @@songs = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@songs[id]
  end

  def self.find_by_album

  end

  def update(name)
    self.name = name
    @@songs[self.id] = Song.new(self.name, self.id)
  end

  def delete
    @@songs.delete(self.id)
  end
end
