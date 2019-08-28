#!/usr/bin/ruby
require './lib/ruby_logic'

puts "How many options?"
option_number = gets.chomp.to_i

choice_list = []
i = 0
loop do
  i += 1
  puts "Enter Each Option:"
  option_choices = gets.chomp
  choice_list << option_choices
  if i == option_number
    puts "Here are the options to choose from:"
    choice_list.each do |choice|
      puts choice
    end
    puts "How many people are voting:"
    people_number = gets.chomp.to_i

    people = []
    i = 0
    loop do
      puts "Enter Each Person:"
      person = gets.chomp
      people << person
      i += 1
      if i == people_number
        i = 0
        choice_list.each do |choice|
          i += 1
          puts ""
          puts "For #{choice} input #{i}"
        end

        vote_list = []
        i = 0
        loop do
          people.each do |individual|
            i += 1
            puts ""
            puts "#{individual} cast your vote:"
            vote1 = gets.chomp
            if vote1 == 1
              vote_list[0] += 1
            elsif vote1 == 2
              vote_list[1] += 1
            elsif vote1 == 3
              vote_list[2] += 1
            elsif i == people_number
              puts "The Final Results Are:"
              puts "#{choice_list.zip(vote_list)}"
            end
          end
        end
      end
    end
  end
end