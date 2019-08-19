require('rspec')
require('ruby_logic')

describe('#wins?') do

  #all the combinations with the rock as the object
  it("returns true if rock is the object and scissors is the argument") do
    game = RPS.new()
    expect(game.wins?("rock", "scissors")).to(eq(true))
  end

  it("returns true if rock is the object and paper is the argument") do
    game = RPS.new()
    expect(game.wins?("rock", "paper")).to(eq(false))
  end

  it("returns true if rock is the object and rock is the argument") do
    game = RPS.new()
    expect(game.wins?("rock", "rock")).to(eq(false))
  end

  #all combinations where the scissors are the object
  it("returns true if scissors is the object and paper is the argument") do
    game = RPS.new()
    expect(game.wins?("scissors", "paper")).to(eq(true))
  end

  it("returns true if scissors is the object and rock is the argument") do
    game = RPS.new()
    expect(game.wins?("scissors", "rock")).to(eq(false))
  end

  it("returns true if scissors is the object and scissors is the argument") do
    game = RPS.new()
    expect(game.wins?("scissors", "scissors")).to(eq(false))
  end

    #al combinations where paper is the object
  it("returns true if paper is the object and rock is the argument") do
    game = RPS.new()
    expect(game.wins?("paper", "rock")).to(eq(true))
  end

  it("returns true if paper is the object and scissors is the argument") do
    game = RPS.new()
    expect(game.wins?("paper", "scissors")).to(eq(false))
  end

  it("returns true if paper is the object and paper is the argument") do
    game = RPS.new()
    expect(game.wins?("paper", "paper")).to(eq(false))
  end
end
