require('sinatra')
require('sinatra/reloader')
require('./lib/album')
require('./lib/song')
require('pry')
#require('./public/bootstrap')
also_reload('lib/**/*.rb')

get('/') do
  @albums = Album.all
  @sold_albums = Album.all_sold
  erb(:albums)
end

get('/albums') do
  @albums = Album.all
  @sold_albums = Album.all_sold
  @albums = Album.search(params[:search]) if params[:search]
  erb(:albums)
end

get 'search' do
  @albums = Album.search(params[:search]) if params[:search]
  erb(:results)
end

get('/albums/new') do
  erb(:new_album)
end

post('/albums') do
  name = params[:album_name]
  album = Album.new(name, nil)
  album.save()
  @albums = Album.all()
  erb(:albums)
end

get('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  erb(:album)
end

patch('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  @album.update(params[:name])
  @albums = Album.all
  erb(:albums)
end

delete('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  @album.delete()
  @albums = Album.all
  erb(:album)
end

get('/albums/:id/edit') do
  @album = Album.find(params[:id].to_i())
  erb(:edit_album)
end
