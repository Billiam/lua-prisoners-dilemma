local actions = require('lib.actions')
local range_action = require('lib.strategy.range_action')

return function(cooperate_rounds)
  cooperate_rounds = cooperate_rounds or 1
  
  return range_action(cooperate_rounds, actions.COOPERATE)
end
