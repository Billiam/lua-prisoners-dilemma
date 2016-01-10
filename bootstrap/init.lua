local History = require('lib.history')
local strategy = require('lib.strategy.spiteful')
local config = require('config')

local Bootstrap = {}

function Bootstrap.run(opponent, discipline, opponent_action, player_action)
  local history = History.create(config.history_path)
  history:load()
  history:add_actions(opponent, opponent_action, player_action)
  history:save()

  local result = strategy(history:round(opponent), config.total_rounds, history:log(opponent))

  io.write(result)
end

return function(...)
  Bootstrap.run(...)
end
