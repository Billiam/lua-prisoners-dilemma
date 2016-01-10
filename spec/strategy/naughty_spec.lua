local naughty = require('lib.strategy.naughty')

describe("naughty", function()
  it("always confesses", function()
    for i=1,5 do
      assert.are.same('confess', naughty())
    end
  end)
end)
