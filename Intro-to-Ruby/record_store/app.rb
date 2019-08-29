require('sinatra')
require('sinatra/reloader')
require('./lib/album')
require('./lib/song')
require('pry')
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
  @album = Album.new({:name => name, :artist => nil, :year => nil, :genre => nil, :length => nil,  :id => nil})
  @album.save()
  @albums = Album.all()
  @sold_albums = Album.all_sold
  erb(:albums)
end

get('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  erb(:album)
end

patch('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  @album.update({ name: params[:name] })
  @albums = Album.all
  erb(:albums)
end

delete('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  @album.delete()
  redirect to('/albums')
end

get('/albums/:id/edit') do
  @album = Album.find(params[:id].to_i())
  erb(:edit_album)
end

get('/albums/:id/songs/:song_id') do
  @song = Song.find(params[:song_id].to_i())
  erb(:song)
end

post('/albums/:id/songs') do
  @album = Album.find(params[:id].to_i())
  song = Song.new({ name: params[:song_name], album_id: @album.id })
  song.save()
  erb(:album)
end

patch('/albums/:id/songs/:song_id') do
  @album = Album.find(params[:id].to_i())
  song = Song.find(params[:song_id].to_i())
  song.update(name: params[:name])
  erb(:album)
end

delete('/albums/:id/songs/:song_id') do
  song = Song.find(params[:song_id].to_i())
  song.delete
  @album = Album.find(params[:id].to_i())
  erb(:album)
end