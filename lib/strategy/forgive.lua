local actions = require('lib.actions')

return function(memory)
  
  return function(round, total_rounds, history)
    -- if all records is memory count are "confess" 
    -- spit out two silent actions
    if round - 1 < memory then
      return
    end
    
    local start_round = round - memory
    if history[round - 1].player_action == actions.COOPERATE then
      start_round = start_round - 1
    end
    start_round = math.max(1, start_round)

    local end_round = start_round + memory - 1
    for i=start_round, end_round do
      if history[i].player_action == actions.COOPERATE then
        return
      end
    end

    return actions.COOPERATE
  end
end
