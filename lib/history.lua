require('vendor.save_file')

local History = {}
History.mt = { __index = History }

function History.create(path)
  local instance = {
    path = path,
    opponents = {}
  }

  return setmetatable(instance, History.mt)
end

function History:add_actions(opponent, opponent_action, player_action)
  if not self.opponents[opponent] then
    self.opponents[opponent] = {}
  end
  table.insert(self.opponents[opponent], {action=opponent_action, player_action=player_action})
end

function History:load()
  local data = table.load(self.path)
  if data then
    self.opponents = data
  end
end

function History:save()
  table.save(self.opponents, self.path)
end

function History:log(opponent)
  return self.opponents[opponent] or {}
end

function History:round(opponent)
  return #self:log(opponent) + 1
end

return History
