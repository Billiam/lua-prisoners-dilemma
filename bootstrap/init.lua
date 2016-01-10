local History = require('lib.history')
local strategy = require('lib.strategy.spiteful')
local config = require('config')

local Bootstrap = {}

function Bootstrap.run(opponent, discipline, opponent_action, player_action)
  assert(opponent, "opponent is required (usage: dilemma opponent_name discipline opponent_action player_action)")
  
  local history = History.create(config.history_path)
  history:load()
  history:add_actions(opponent, opponent_action, player_action)
  history:save()

  local result = strategy(history:round(opponent), config.total_rounds, history:log(opponent))

  io.write(result .. "\n")
end

return function(...)
  Bootstrap.run(...)
end
