return function(...)
  local strategy_list = {...}

  return function(...)
    for _,strategy in ipairs(strategy_list) do
      local strategy_result = strategy(...)
      if strategy_result then
        return strategy_result
      end
    end
  end
end
