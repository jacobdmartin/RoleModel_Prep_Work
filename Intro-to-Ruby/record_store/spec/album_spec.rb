
require 'rspec'
require 'album'
require 'song'

describe '#Album' do

  before(:each) do
    Album.clear()
  end

  describe('.all') do
    it("returns an empty array when there are no albums") do
      expect(Album.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves an album") do
      album = Album.new({:name => "In Rainbows", :artist => "Radiohead", :year => 2007, :genre => "Rock", :length => "42:39", :id => 1})
      album.save()
      album2 = Album.new({:name => "On Rainbows", :artist => "SomeOne", :year => 2017, :genre => "Pop", :length => "43:50", :id => 2})
      album2.save()
      expect(Album.all).to(eq([album, album2]))
    end
  end

  describe('#==') do
    it("is the same album if it has the same attributes as another album") do
      album = Album.new({:name => "In Rainbows", :artist => "Radiohead", :year => 2007, :genre => "Rock", :length => "42:39", :id => 1})
      album2 = Album.new({:name => "In Rainbows", :artist => "Radiohead", :year => 2007, :genre => "Rock", :length => "42:39", :id => 1})
      expect(album).to(eq(album2))
    end
  end

  describe('.clear') do
    it("clears all albums") do
      album = Album.new({:name => "In Rainbows", :artist => "Radiohead", :year => 2007, :genre => "Rock", :length => "42:39", :id => 1})
      album.save()
      album2 = Album.new({:name => "On Rainbows", :artist => "Radiohead", :year => 2007, :genre => "Rock", :length => "42:39", :id => 1})
      album2.save()
      Album.clear()
      expect(Album.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds an album by id") do
      album = Album.new({:name => "In Rainbows", :artist => "Radiohead", :year => 2007, :genre => "Rock", :length => "42:39", :id => 1})
      album.save()
      album2 = Album.new({:name => "In Rainbows", :artist => "Radiohead", :year => 2007, :genre => "Rock", :length => "42:39", :id => 1})
      album2.save()
      expect(Album.find(album.id)).to(eq(album))
    end
  end

  describe('#update') do
    it("updates an album by id") do
      album = Album.new({:name => "In Rainbows", :artist => "Radiohead", :year => 2007, :genre => "Rock", :length => "42:39", :id => 1})
      album.save()
      album.update("A Love Supreme")
      expect(album.name).to(eq("A Love Supreme"))
    end
  end

  describe('#delete') do
    it("deletes an album by id") do
      album = Album.new({:name => "In Rainbows", :artist => "Radiohead", :year => 2007, :genre => "Rock", :length => "42:39", :id => 1})
      album.save()
      album2 = Album.new({:name => "On Rainbows", :artist => "SomeOne", :year => 2017, :genre => "Pop", :length => "41:00", :id => 2})
      album2.save()
      album.delete()
      expect(Album.all).to(eq([album2]))
    end
  end

  describe('#sold') do
    it('takes an album from "@@albums" and places it in "@@sold_albums"') do
      album = Album.new(:name => "On Rainbows", :artist => "SomeOne", :year => 2017, :genre => "Pop", :length => "41:00", :id => 1)
      album.save()
      sold_albums = album.sold()
      expect(album.sold()).to(eq(sold_albums))
    end
  end

  describe('#songs') do
    it("returns an album's songs") do
      album = Album.new(:name => "On Rainbows", :artist => "SomeOne", :year => 2017, :genre => "Pop", :length => "41:00", :id => 1)
      album.save()
      song = Song.new(:name => "Here It Is", :artist => "SomeOne", :lyrics => "1:00", :id => 1, :album_id => 1)
      song.save()
      song2 = Song.new(:name => "It Is Not Here", :artist => "SomeOne", :lyrics => "3:00", :id => 2, :album_id => 1)
      song2.save()
      expect(album.songs).to(eq([song, song2]))
    end
  end

  describe("#name") do
    it("returns the name of an album") do
      album = Album.new({:name => "In Rainbows", :artist => "Radiohead", :year => 2007, :genre => "Rock", :length => "42:39", :id => 1})
      expect(album.name()).to(eq("In Rainbows"))
    end
  end
end
