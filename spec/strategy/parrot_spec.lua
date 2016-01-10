local strategy = require('lib.strategy.parrot')

describe('parrot', function()
  describe("when there is no history", function()
    local history = {}
  
    it("takes no action", function()
      assert.is_nil(strategy(1, 50, history))
    end)
  end)
  
  describe("when provided with previous history", function()
    local history = {
      {action="silent", player_action="confess"},
      {action="confess", player_action="confess"},
      {action="silent", player_action="silent"},
    }

    it("repeats actions", function()
      assert.is_nil(strategy(1, 50, history))
      assert.are.same('silent', strategy(2, 50, history))
      assert.are.same('confess', strategy(3, 50, history))
      assert.are.same('silent', strategy(4, 50, history))
    end)
  end)
end)
