require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/artist')
require('./lib/album')

get('/') do
  @artists = Artist.all()
  erb(:index)
end

post('/artists') do
  @artist_name = params.fetch('artist')
  Artist.new({:artist_name => @artist_name}).save()
  @artists = Artist.all()
  erb(:index)
end

get('/artists/:id') do
  @artists = Artist.find(params.fetch(@artists))
  erb(:albums)
end

get('/album') do
  @album_name = params.fetch('album')
  @albums = Album.new({:album_name => @album_name}).save()

end



#
#
# post("/") do
#   @artists = Artist.clear()
#   erb(:index)
# end
