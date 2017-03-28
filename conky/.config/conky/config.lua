function config(path)
  -- Read lines into table
  local lines = lines_from(path)

  -- Create config var
  local config = {}

  -- Parse file line by line
  for i, line in pairs(lines) do
    local key, val = line:match("([^=]+)=(.+)")
    config[key] = val
  end

  return config
end

return config
