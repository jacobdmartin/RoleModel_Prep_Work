require('sinatra')
require('sinatra-contrib')
require('./lib/board')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
    @board = Board.all 
    erb(:board)
end 
