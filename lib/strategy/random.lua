local actions = require('lib.actions')

return function(confession_chance)
  return function()
    return math.random() < confession_chance and actions.DEFECT or actions.COOPERATE
  end
end
