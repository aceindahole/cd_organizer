class Album
  attr_reader(:album_name, :id)
  @@albums = []

  define_method(:initialize) do |attributes|
    @album_name = attributes.fetch(:album_name)
    @id = @@albums.length().+(1)
  end

  define_singleton_method(:all) do
    @@albums
  end

  define_method(:save) do
    @@albums.push(self)
  end

  define_singleton_method(:clear) do
    @@albums = []
  end

  define_singleton_method(:find) do |identification|
    @@albums.each() do |album|
      if album.id().eql?(identification)
        return album
      end
    end
  end
end
