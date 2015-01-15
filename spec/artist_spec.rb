require('rspec')
require('artist')
require('album')

describe(Artist) do
  before() do
    Artist.clear()
  end

  describe('#artist_name') do
    it('returns the name of the artist') do
      test_artist = Artist.new({:artist_name => "The Beatles"})
      expect(test_artist.artist_name()).to(eq("The Beatles"))
    end
  end

  describe('#id') do
    it('returns the id of the artist') do
      test_artist = Artist.new({:artist_name => "The Beatles"})
      expect(test_artist.id()).to(eq(1))
    end
  end

  describe('#save') do
    it('saves the artist name to the array of saved artist names') do
      test_artist = Artist.new({:artist_name => "The Beatles"})
      test_artist.save()
      expect(Artist.all()).to(eq([test_artist]))
    end
  end

  describe('.all') do
    it('is empty before putting an artist in') do
      expect(Artist.all()).to(eq([]))
    end
  end

  describe('.clear') do
    it('empties out all fo the saved artists') do
      Artist.new({:artist_name => "The Beatles"}).save()
      Artist.clear()
      expect(Artist.all()).to(eq([]))
    end
  end

  describe('.find') do
    it('returns an artist by their id number') do
      test_artist = Artist.new({:artist_name => "The Beatles"})
      test_artist.save()
      test_artist2 = Artist.new({:artist_name => "The Rolling Stones"})
      test_artist2.save()
      expect(Artist.find(test_artist.id())).to(eq(test_artist))
    end
  end
end
