local curl = require 'cURL'

local function get_weather()
  result = ''

  local c = curl.easy {
    url = 'http://wttr.in/moncton',
    httpheader = { 'User-Agent: curl' },
    writefunction = function(str) result = str end,
  }

  local function perform()
    c:perform()
  end

  if not pcall(perform) then return false end

  return result

end

local cache = ''

function conky_main()
  if conky_window == nil then return end

  updates = tonumber(conky_parse("${updates}"))
  interval = 10
  timer = (updates % interval)
  print(timer)

  if timer ~= 0 then return cache end

  local weather = get_weather()
  -- weather = weather:split('\n')
  -- weather = subrange(weather, 2, 7)
  -- weather = table.concat(weather, '\n')
  print(weather)
  -- cache = weather
  return cache
end

function string:split( inSplitPattern, outResults )
  if not outResults then
    outResults = { }
  end
  local theStart = 1
  local theSplitStart, theSplitEnd = string.find( self, inSplitPattern, theStart )
  while theSplitStart do
    table.insert( outResults, string.sub( self, theStart, theSplitStart-1 ) )
    theStart = theSplitEnd + 1
    theSplitStart, theSplitEnd = string.find( self, inSplitPattern, theStart )
  end
  table.insert( outResults, string.sub( self, theStart ) )
  return outResults
end

function subrange(t, first, last)
  local sub = {}
  for i=first,last do
    sub[#sub + 1] = t[i]
  end
  return sub
end
