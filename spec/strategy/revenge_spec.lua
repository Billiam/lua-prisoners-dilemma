local Revenge = require('lib.strategy.revenge')

describe('revenge', function()
  local strategy
  before_each(function()
    strategy = Revenge()
  end)

  describe("when there is no previous history", function()
    it("takes no action", function()
      assert.is_nil(strategy(1, 10, {}))
    end)
  end)

  describe("when nobody confessed last round", function()
    local history = { action="silent", player_action="silent" }
    it("takes no action", function()
      assert.is_nil(strategy(2, 10, {history}))
    end)
  end)
  
  describe("when player confessed last round", function()
    local history = { action="silent", player_action="confess" }
    
    it("confesses again", function()
      assert.same('confess', strategy(2, 10, {history}))
    end)
  end)
  
  describe("when opponent confessed last round", function()
    local history = { action="confess", player_action="silent" }
    it("confesses in retribution", function()
      assert.same('confess', strategy(2, 10, {history}))
    end)
  end)
end)
