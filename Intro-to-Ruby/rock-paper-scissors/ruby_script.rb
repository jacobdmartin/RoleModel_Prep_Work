#!/usr/bin/ruby
require_relative './lib/ruby_logic'

# create a new instance of your RPS object
game = RPS.new()
# initiate starting the game
puts "Please enter players names"
#enter players names
puts "Please enter Player 1 name:"
player1_name = gets.chomp
puts "Please eneter Player 2 name:"
player2_name = gets.chomp
#enter players input
puts "#{player1_name} choice"
player1_input = gets.chomp
puts "#{player2_name} choice"
player2_input = gets.chomp
#outcome of the game
player1_wins = game.wins?(player1_input, player2_input)
if player1_wins
  puts "#{player1_name} wins!"
else
  puts "#{player2_name} wins!"
end
