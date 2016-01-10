local RangeAction = require('lib.strategy.range_action')

describe('round action', function()
  describe("with a positive round limit", function()
    local strategy
    before_each(function()
      strategy = RangeAction(2, 'action')
    end)

    it("takes action on the first rounds", function()
      assert.are.same('action', strategy(1, 10, {}))
      assert.are.same('action', strategy(2, 10, {}))
      assert.is_nil(strategy(3, 10, {}))
    end)
  end)

  describe("with no round limit", function() 
    local strategy
    before_each(function()
      strategy = RangeAction(0, 'action')
    end)

    it("takes no action", function()
      assert.is_nil(strategy(1, 10, {}))
      assert.is_nil(strategy(10, 10, {}))
    end)
  end)
  
  describe("with a negative round limit", function()
    local strategy
    before_each(function()
      strategy = RangeAction(-2, 'action')
    end)

    it("takes action on the last rounds", function()
      assert.is_nil(strategy(8, 10, {}))
      assert.are.same('action', strategy(9, 10, {}))
      assert.are.same('action', strategy(10, 10, {}))
    end)
  end)
end)
