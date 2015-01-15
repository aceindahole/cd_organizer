require('rspec')
require('album')

describe(Album) do
  describe('#album_name') do
    it('returns the name of the album') do
      test_album = Album.new("The White Album")
      expect(test_album.album_name()).to(eq("The White Album"))
    end
  end

  describe('.all') do
    it('is empty before putting a album name in') do
      expect(Album.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves the album name to the array of saved albums') do
      test_album = Album.new("The White Album")
      test_album.save()
      expect(Album.all()).to(eq([test_album]))
    end
  end

end
