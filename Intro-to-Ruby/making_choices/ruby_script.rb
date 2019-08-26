#!/usr/bin/ruby
require './lib/ruby_logic'

class Decision

  def making_choices
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
        puts "How many people are voting:"
        people_number = gets.chomp.to_i

        people = []
        i = 0
        loop do
          i += 1
          puts "Enter Each Person:"
          person = gets.chomp
          people << person
          if i == people_number

            vote_list = []
            i = 0
            loop do
              i += 1
              puts "#{people[1]} cast your vote:"
              vote1 = gets.chomp
              vote_list << vote1
              if i == people_number
                choice_list.zip(vote_list)
                puts "The Final Results Are:"
                puts "#{choice_list}"
              end
            end
          end
        end
      end
    end
  end
end