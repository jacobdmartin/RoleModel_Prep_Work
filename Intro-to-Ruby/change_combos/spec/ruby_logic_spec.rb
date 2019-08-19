require('rspec')
require('ruby_logic')

describe('#change') do
  it("returns true if the argument is a whole number.") do
    amount = Coin_Comb.new()
    expect(amount.change("25".to_i).to(eq(1)))
  end
end
