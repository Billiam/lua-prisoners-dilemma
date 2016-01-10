local nice = require('lib.strategy.nice')

describe("nice", function()
  it("always remains silent", function()
    for i=1,5 do
      assert.are.same('silent', nice())
    end
  end)
end)

