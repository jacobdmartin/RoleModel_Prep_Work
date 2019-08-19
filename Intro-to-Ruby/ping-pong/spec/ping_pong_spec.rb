require('rspec')
require('ping_pong')

describe('#ping_pong') do
  it("Counts from 1 to a given number") do
    expect(7.ping_pong).to(eq([1,2, "ping", 4, "pong", "ping", 7]))
  end

  it("Every third element in the array returns 'ping'") do
    arr = 10.ping_pong
    expect(arr[2]).to(eq('ping'))
  end

  it("every fifth element in the array returns 'pong'") do
    arr = 15.ping_pong
    expect(arr[4]).to(eq('pong'))
  end
end
