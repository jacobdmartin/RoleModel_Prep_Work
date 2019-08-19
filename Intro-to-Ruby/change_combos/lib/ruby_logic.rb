class Coin_Comb
  user_amount = 0
  def change(user_amount)
    until user_amount > 25
      quaters = user_amount % 25
    end
      until user_amount >= 10 do
        dimes = user_amount%10
      end
        until user_amount >= 5 do
          nickles = user_amount%5
        end
          until user_amount == 0 do
          pennies = user_amount%1
          end
      user_amount = quaters + dimes + nickles + pennies
      puts "Here is your change in the most efficient way possible:"
      puts "#{user_amount}"
  end
end
