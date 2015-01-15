require('rspec')
require('album')

describe(Album) do
  describe('#name') do
    it('returns the name of the album') do
      test_album = Album.new("The White Album")
      expect(test_album.name()).to(ea("The White Album"))
    end
  end
end
