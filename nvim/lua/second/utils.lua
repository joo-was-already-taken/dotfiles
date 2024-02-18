local value_difference = function(a, b)
  local b_set = {}
  for _, val in pairs(b) do
    b_set[val] = true
  end
  local diff = {}
  for _, val in pairs(a) do
    if b_set[val] ~= nil then
      table.insert(diff, val)
    end
  end
  return diff
end

return {
  value_difference = value_difference,
}
