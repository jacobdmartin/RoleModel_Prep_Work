require('ruby_logic')
require('rspec')

describe('#scrabble') do
  game = GameOfScrabble.new()
  it("returns a scrabble score for a letter") do
    expect(game.scrabble("a")).to(eq(1))
  end
end
