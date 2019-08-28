
require 'rspec'
require 'song'
require 'album'
require 'pry'

describe '#Song' do

  before(:each) do
    Album.clear()
    Song.clear()
    @album = Album.new({:name => "In Rainbows", :artist => "Radiohead", :year => 2007, :genre => "Rock", :length => "42:39", :id => 1})
    @album.save()
  end

  describe('#==') do
    it("is the same song if it has the same attributes as another song") do
      song = Song.new({:name => "In Rainbows", :artist => "Radiohead", :lyrics => "42:39", :id => 1, :album_id => 1})
      song2 = Song.new({:name => "In Rainbows", :artist => "Radiohead", :lyrics => "42:39", :id => 2, :album_id => 1})
      expect(song).to(eq(song2))
    end
  end

  describe('.all') do
    it("returns a list of all songs") do
      song = Song.new({:name => "In Rainbows", :artist => "Radiohead", :lyrics => "42:39", :id => 1, :album_id => 1})
      song.save()
      song2 = Song.new({:name => "On Rainbows", :artist => "Radiohead", :lyrics => "42:39", :id => 2, :album_id => 1})
      song2.save()
      expect(Song.all).to(eq([song, song2]))
    end
  end

  describe('.clear') do
    it("clears all songs") do
      song = Song.new({:name => "In Rainbows", :artist => "Radiohead", :lyrics => "42:39", :id => 1, :album_id => 1})
      song.save()
      song2 = Song.new({:name => "On Rainbows", :artist => "Radiohead", :lyrics => "42:39", :id => 2, :album_id => 1})
      song2.save()
      Song.clear()
      expect(Song.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a song") do
      song = Song.new({:name => "In Rainbows", :artist => "Radiohead", :lyrics => "42:39", :id => 1, :album_id => 1})
      song.save()
      expect(Song.all).to(eq([song]))
    end
  end

  describe('.find') do
    it("finds a song by id") do
      song = Song.new({:name => "In Rainbows", :artist => "Radiohead", :lyrics => "42:39", :id => 1, :album_id => 1})
      song.save()
      song2 = Song.new({:name => "On Rainbows", :artist => "Radiohead", :lyrics => "42:39", :id => 2, :album_id => 1})
      song2.save()
      expect(Song.find(song.id)).to(eq(song))
    end
  end

  describe('#update') do
    it("updates an song by id") do
      song = Song.new({:name => "In Rainbows", :artist => "Radiohead", :lyrics => "42:39", :id => 1, :album_id => 1})
      song.save()
      song = song.update({:name => "Mr. P.C.", :artist => "Radiohead", :lyrics => "42:39", :id => 1, :album_id => 1})
      expect(song.name).to(eq("Mr. P.C."))
    end
  end

  describe('#delete') do
    it("deletes an song by id") do
      song = Song.new({:name => "In Rainbows", :artist => "Radiohead", :lyrics => "42:39", :id => 1, :album_id => 1})
      song.save()
      song2 = Song.new({:name => "In Rainbows", :artist => "Radiohead", :lyrics => "42:39", :id => 2, :album_id => 1})
      song2.save()
      song.delete()
      expect(Song.all).to(eq([song2]))
    end
  end

  describe('.find_by_album') do
    it("finds songs for an album") do
      album = Album.new({:name => "In Rainbows", :artist => "Radiohead", :year => 2007, :genre => "Rock", :length => "42:39", :id => 1})
      album.save
      song = Song.new({:name => "In Rainbows", :artist => "Radiohead", :lyrics => "42:39", :id => 1, :album_id => 1})
      song.save()
      song2 = Song.new({:name => "In Rainbows", :artist => "Radiohead", :lyrics => "42:39", :id => 2, :album_id => 1})
      song2.save()
      expect(Song.find_by_album(album.id)).to(eq([song, song2]))
    end
  end

  describe('#album') do
    it("finds the album a song belongs to") do
      song = Song.new({:name => "In Rainbows", :artist => "Radiohead", :lyrics => "42:39", :id => 1, :album_id => 1})
      song.save()
      expect(song.album()).to(eq(@album))
    end
  end
end
