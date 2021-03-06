class Artist
  attr_reader(:artist_name, :id, :wrote)
  @@artists = []

  define_method(:initialize) do |attributes|
    @artist_name = attributes.fetch(:artist_name)
    @wrote = []
    @id = @@artists.length().+(1)
  end

  define_method(:save) do
    @@artists.push(self)
  end

  define_singleton_method(:all) do
    @@artists
  end

  define_singleton_method(:clear) do
    @@artists = []
  end

  define_singleton_method(:find) do |identification|
    @@artists.each() do |artist|
      if artist.id().eql?(identification)
        return artist
      end
    end
  end

  define_method(:add_album) do |album|
    @wrote.push(album)
  end
end
