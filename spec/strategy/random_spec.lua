local Random = require('lib.strategy.random')

describe('random', function()
  describe('accepts a confession probability', function()
    before_each(function()
      math.randomseed(123456)
    end)
    
    it("rarely confesses given low probability", function()
      local strategy = Random(0)
      
      for i=1,1000 do
        assert.are.same('silent', strategy())
      end
    end)
  
    it("probably confesses given high probability", function()
      local strategy = Random(1)
      
      for i=1,1000 do
        assert.are.same('confess', strategy())
      end
    end)
  end)
end)
