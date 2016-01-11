local DefectLastRounds = require('lib.strategy.defect_last_rounds')

describe('defects at the end', function()
  describe("with no round limit", function()
    local strategy
    before_each(function()
      strategy = DefectLastRounds()
    end)
    
    it("defects on the last round", function()
      assert.are.same('confess', strategy(50, 50, {}))
    end)
  end)

  describe("for a round limit of 5", function()
    local strategy
    before_each(function()
      strategy = DefectLastRounds(5)
    end)

    it("takes no action before the last five rounds", function()
      assert.is_nil(strategy(43, 50, {}))
      assert.is_nil(strategy(44, 50, {}))
    end)
    
    it("defects for 5 rounds", function()
      assert.are.same('confess', strategy(46, 50, {}))
      assert.are.same('confess', strategy(47, 50, {}))
      assert.are.same('confess', strategy(48, 50, {}))
      assert.are.same('confess', strategy(49, 50, {}))
      assert.are.same('confess', strategy(50, 50, {}))
    end)
  end)
end)
