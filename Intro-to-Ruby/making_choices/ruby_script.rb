#!/usr/bin/ruby
require_relative './lib/ruby_logic'

# create new instance of opinions
choice_made = Decision.new()
#input number of options
puts "How many options?"
option_number = gets.chomp
i = 0
choice_list = []
#Making a list of the different options
until i = option_number
  puts "Enter the options"
  option_choices = gets.chomp
  choice_list.push(option_choices)
  i+=1
end
#outputing the options
puts "Here are the options:"
puts "#{choice_list}"
#asking for input on how many people are voting
puts "How many people are voting?"
people_number = gets.chomp.to_i
votes_list = []
#outputing the votes that are casted
puts "Here are the votes:"
puts "#{opinions}"
