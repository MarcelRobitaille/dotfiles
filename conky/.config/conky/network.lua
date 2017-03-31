local F = require('F')

values = {}
values.downspeedf = {}
values.upspeedf = {}

function network(variable, interface)
  local value = conky_parse(F '${%{variable} %{interface}}'):gsub("%s+$", "")

  local t = values[variable]
  table.insert(t, value)

  while #t > 150 do
    table.remove(t, 1)
  end
  local units = ' kB/s'
  local value = max(t)

  if value > 1024 then
    value = value / 1024
    value = math.floor(value * 10) / 10
    units = ' MB/s'
  end

  return value .. units
end

function max(a)
  local max_value = 0

  for i,string in pairs(a) do
    num = string*1
    if num > max_value then
      max_value = num
    end
  end

  return max_value
end

return network
