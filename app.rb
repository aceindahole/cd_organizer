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
  @artists = Artist.find(params.fetch('id').to_i())
  @albums = Album.all()
  erb(:artists)
end

post('/albums') do
  @album_name = params.fetch('album')
  @albums = Album.new({:album_name => @album_name}).save()
  @artists = Artist.find(params.fetch('artist_id').to_i())
  @artists.add_album(@album_name)
  @albums = Album.all()
  erb(:artists)
end
