class Album
  attr_reader(:album_name)
  @@albums = []

  define_method(:initialize) do |album_name|
    @album_name = album_name
  end

  define_singleton_method(:all) do
    @@albums
  end

  define_method(:save) do
    @@albums.push(self)
  end

end
