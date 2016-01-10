local CooperateFirstRounds = require('lib.strategy.cooperate_first_rounds')

describe('cooperate first', function()
  describe("with no round limit", function()
    local strategy
    before_each(function()
      strategy = CooperateFirstRounds()
    end)
    
    it("cooperates for one round", function()
      assert.are.same('silent', strategy(1, 50, {}))
    end)
    
    it("takes no action after first round", function()
      assert.is_nil(strategy(2, 50, {}))
      assert.is_nil(strategy(3, 50, {}))
    end)
  end)
  
  describe("for a round limit of 5", function()
    local strategy
    before_each(function()
      strategy = CooperateFirstRounds(5)
    end)
    
    it("cooperates for 5 rounds", function()
      assert.are.same('silent', strategy(1, 50, {}))
      assert.are.same('silent', strategy(2, 50, {}))
      assert.are.same('silent', strategy(3, 50, {}))
      assert.are.same('silent', strategy(4, 50, {}))
      assert.are.same('silent', strategy(5, 50, {}))
    end)

    it("takes no action after fifth round", function()
      assert.is_nil(strategy(6, 50, {}))
      assert.is_nil(strategy(7, 50, {}))
    end)
  end)
end)
