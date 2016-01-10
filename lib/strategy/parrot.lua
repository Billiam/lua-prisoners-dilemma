return function(round, total_rounds, history)
  local previous_round = history[round - 1]
  return previous_round and previous_round.action or nil
end
