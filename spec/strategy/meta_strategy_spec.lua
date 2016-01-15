local MetaStrategy = require('lib.strategy.meta_strategy')

describe('meta strategy', function()
  it("passes arguments to all strategies", function()
    local history = {{action="silent", player_action="confess"}}
    
    local spies = {
      spy.new(function() end),
      spy.new(function() end),
      spy.new(function() end),
    }
    
    local strategy = MetaStrategy(spies[1], spies[2], spies[3])
    
    strategy(2, 50, history)
    
    for i=1, 3 do
      assert.spy(spies[i]).was_called_with(2, 50, history)
    end
  end)
  
  it("returns the first non-nil strategy response", function()
    local strategies = {
      function() end,
      function() return 'confess' end,
      function() return 'silent' end
    }

    local strategy = MetaStrategy(table.unpack(strategies))
    
    assert.same('confess', strategy(1, 10, {}))
  end)
  
  it("does not call strategies after receiving a response", function()
    local history = {{action="silent", player_action="confess"}}

    local spies = {
      spy.new(function() end),
      spy.new(function() return 'confess' end),
      spy.new(function() end),
    }

    local strategy = MetaStrategy(spies[1], spies[2], spies[3])

    strategy(2, 50, history)

    assert.spy(spies[1]).was_called_with(2, 50, history)
    assert.spy(spies[2]).was_called_with(2, 50, history)
    assert.spy(spies[3]).was_not_called()
  end)
end)
