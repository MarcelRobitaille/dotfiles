local F = require('F')

function top_mem(pos)
  local value = conky_parse(F "${top_mem mem_res %{pos}}")
  value = value:sub(0, value:len() - 3)
  return value .. ' MB'
end

return top_mem
