#!/usr/bin/ruby
require './lib/ruby_logic'

puts "How many options?"
option_number = gets.chomp.to_i

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
end

puts "How many people are voting:"
people_number = gets.chomp.to_i

people = []
i = 0

while i != people_number do
  puts "Enter Each Person:"
  person = gets.chomp
  people << person
  i += 1
end

if i == people_number
  i = 0
  choice_list.each do |choice|
    i += 1
    puts ""
    puts "For #{choice} input #{i}"
  end
end

vote_list = []
i = 0

while i != people_number do
  i += 1
  people.each do |individual|
    puts ""
    puts "#{individual} cast your vote:"
    vote1 = gets.chomp
    if vote1 == 1
      vote_list[0] += 1
    elsif vote1 == 2
      vote_list[1] += 1
    elsif vote1 == 3
      vote_list[2] += 1
    end
  end
end

puts "The Final Results Are:"
puts "#{choice_list.zip(vote_list)}"
