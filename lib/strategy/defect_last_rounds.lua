local actions = require('lib.actions')
local range_action = require('lib.strategy.range_action')

return function(defect_rounds)
  defect_rounds = defect_rounds or 1
  
  return range_action(-defect_rounds, actions.DEFECT)
end
