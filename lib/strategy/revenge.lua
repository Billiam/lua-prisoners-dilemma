local actions = require('lib.actions')

return function()
  return function(round, total_rounds, history)
    local last_round = history[round - 1]
    if not last_round then
      return
    end
    
    if last_round.action == 'confess' or last_round.player_action == actions.DEFECT then
      return actions.DEFECT
    end
  end
end
