require('sinatra')
require('sinatra/reloader')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @albums = Album.all
  erb(:albums)
end

get('/albums') do
  @albums = Album.all
  erb(:albums)
end

get('/test') do
  @something = "this is a variable"
  erb(:whatever)
end
