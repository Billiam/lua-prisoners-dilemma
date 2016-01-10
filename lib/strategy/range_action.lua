return function(range, action)
  return function(round, total_rounds)
    local range_start = 1
    local range_end = total_rounds

    if range < 0 then
      range_start = total_rounds + range + 1
    else
      range_end = range
    end

    if round >= range_start and round <= range_end then
      return action
    end
  end
end
