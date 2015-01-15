class Album
  attr_reader(:album_name)

  define_method(:initialize) do |album_name|
    @album_name = album_name
  end
end
