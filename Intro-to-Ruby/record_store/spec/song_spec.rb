require 'rspec'
require 'song'

describe '#Song' do

  before(:each) do
    Song.clear()
  end

  describe('.all') do
    it("returns an empty array when there are no songs") do
      expect(Song.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a song") do
      song = Song.new("Giant Steps", nil) #nil added as second argument
      song.save()
      song2 = Song.new("Blue", nil) #nil added as second argument
      song2.save()
      expect(Song.all).to(eq([song, song2]))
    end
  end

  describe('#==') do
    it("is the same song if it has the same attributes as another song") do
      song = Song.new("Blue", nil)
      song2 = Song.new("Blue", nil)
      expect(song).to(eq(song2))
    end
  end

  describe('.clear') do
    it("clears all songs") do
      song = Song.new("Giant Steps", nil)
      song.save()
      song2 = Song.new("Blue", nil)
      song2.save()
      Song.clear()
      expect(Song.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds an song by id") do
      song = Song.new("Giant Steps", nil)
      song.save()
      song2 = Song.new("Blue", nil)
      song2.save()
      expect(Song.find(song.id)).to(eq(song))
    end
  end

  describe('#update') do
    it("updates an song by id") do
      song = Song.new("Giant Steps", nil)
      song.save()
      song.update("A Love Supreme")
      expect(song.name).to(eq("A Love Supreme"))
    end
  end

  describe('#delete') do
    it("deletes an song by id") do
      song = Song.new("Giant Steps", nil)
      song.save()
      song2 = Song.new("Blue", nil)
      song2.save()
      song.delete()
      expect(Song.all).to(eq([song2]))
    end
  end
end
