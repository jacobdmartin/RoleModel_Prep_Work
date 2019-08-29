#!/usr/bin/ruby
require './lib/ruby_logic'

puts "How many options"
option_number = gets.chomp.to_i

while option_number > 10 do
  puts "Number of options cannot be less then 0 or greater then 10"
  puts "How many options"
  option_number = gets.chomp.to_i
end


choice_list = []
i = 0

while i != option_number do
  puts "Enter Each Option:"
  choices = gets.chomp
  choice_list << choices
  i += 1
end

if i == option_number
  puts "Here are the options to choose from:"
  choice_list.each do |choice|
    puts choice
  end
  puts ""
end

puts "How many people are voting:"
people_number = gets.chomp.to_i

people = []
i = 0

while i != people_number do
  puts "Enter Each Person:"
  person = gets.chomp.upcase
  people << person
  i += 1
end

if i == people_number
  i = 0
  puts ""
  choice_list.each do |choice|
    i += 1
    puts "For #{choice} input #{i}"
  end
  puts ""
end

vote_list = [0,0,0,0,0,0,0,0,0,0]
i = 0

while i != people_number do
  people.each do |person|
    i += 1
    puts ""
    puts "#{person} cast your vote:"
    vote1 = gets.chomp.to_i
    if vote1 == 1
      vote_list[0] += 1
    elsif vote1 == 2
      vote_list[1] += 1
    elsif vote1 == 3
      vote_list[2] += 1
    elsif vote1 == 4
      vote_list[3] += 1
    elsif vote1 == 5
      vote_list[4] += 1
    elsif vote1 == 6
      vote_list[5] += 1
    elsif vote1 == 7
      vote_list[6] += 1
    elsif vote1 == 8
      vote_list[7] += 1
    elsif vote1 == 9
      vote_list[8] += 1
    elsif vote1 == 10
      vote_list[9] += 1
    end
  end
end

puts "The Final Results Are:"
puts "#{choice_list.zip(vote_list)}"
