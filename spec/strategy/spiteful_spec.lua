local strategy = require('lib.strategy.spiteful')

describe("spiteful", function()
  local opponent_actions = {
    "silent",
    "silent",
    "silent",
    "confess",
    "silent",
    "confess",
    "silent",
    "confess",
    "silent",
    "silent",
    "confess",
    "silent",
    "confess",
    "confess",
    "silent",
    "silent",
    "silent",
    "silent",
    "silent",
    "silent",
  }
  
  local expected_responses = {
    "silent",
    "silent",
    "silent",
    "silent",
    "confess",
    "confess",
    "confess",
    "confess",
    "confess",
    "confess",
    "confess",
    "confess",
    "confess",
    "confess",
    "silent",
    "silent",
    "silent",
    "silent",
    "silent",
    "confess",
  }
  
  it("has expected outputs for opponent actions", function()
    local results = {}
    local history = {}
    
    for i, action in ipairs(opponent_actions) do
      local response = strategy(i, 20, history)
      
      table.insert(results, response)
      table.insert(history, { action=action, player_action=response })
    end
    
    assert.are_same(expected_responses, results)
  end)
end)
