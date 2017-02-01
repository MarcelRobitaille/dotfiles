local curl = require 'cURL'

-- Checks if file exists
function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

-- Read file into table of lines
function lines_from(file)
  if not file_exists(file) then return {} end
  lines = {}
  for line in io.lines(file) do
    lines[#lines + 1] = line
  end
  return lines
end


--
-- Read env file
-- key=value formatted file
-- You should include `URL=url_to_your_apollo_server` or don't call the apollo function
--

-- Read lines into table
local lines = lines_from('/home/marcel/.config/conky/env')

-- Create config var
local config = {}

-- Parse file line by line
for i, line in pairs(lines) do
  local key, val = line:match("([^=]+)=(.+)")
  config[key] = val
end

-- Set up curl
local c = curl.easy_init()
c:setopt_url(config.URL)

-- Super good code. Don't even worry about it.
local spacer = '                                                                                                          '


--
-- Apollo
-- https://github.com/iambecomeroot/apollo
-- Use this only if you have an apollo server
--

local function apollo()
  local result = ''

  local function get_result()
    c:perform({writefunction = function(str) result = str end})
  end

  -- Curl apollo server
  if not pcall(get_result) then return false end

  -- If this returns a `Cannot GET whatever` error, return false
  if string.sub(result, 0, 10) == 'Cannot GET' then return false end

  -- If response blank, return false
  if result == '' then return false end

  -- Get youtube video id from result
  local id = string.sub(result, 0, 11)
  result = string.sub(result, 12)

  -- Get path to thumbnail
  local thumbname = '/tmp/conkythumbnails/' .. id .. '.jpg'

  -- If thumbnail not saved, download it
  if not file_exists(thumbname) then

    -- Make sure directory exists
    os.execute('mkdir -p /tmp/conkythumbnails')

    -- Open file for writing
    f = assert(io.open(thumbname, 'w'))

    -- Curl thumbnail into file
    local c = curl.easy_init()
      :setopt_url('https://i.ytimg.com/vi/' .. id .. '/maxresdefault.jpg')
      :perform({ writefunction = function(str) f:write(str) end })

    -- Close file
    f:close()
  end

  -- Split long titles into lines
  local title = ''
  while string.len(result) > 50 do
    local i = string.find(string.sub(result, 0, 50), "[ /][^ /]*$")
    title = title .. '${alignc}' .. string.sub(result, 0, i) .. '\n'
    result = string.sub(result, i + 1)
  end
  title = title .. '${alignc}' .. result

  -- Return conky text
  return conky_parse([[
${image ]] .. thumbname .. [[ -s 426x240 -n -f 5}
]] .. spacer .. [[
${voffset 220}
]] .. title)
end


--
-- Main function
-- Called by conky
--

function conky_main()
  if conky_window == nil then return end

  -- If mpd running, show that
  if conky_parse('$mpd_status') == 'Playing' then
    return conky_parse([[
${image /home/marcel/.config/mpd/cover -s 300x300 -n -f 5}
${voffset 300}${alignc}${font Fira Sans:style=bold}${mpd_artist}${font}
${alignc}${mpd_title}
${voffset 10}${mpd_bar 4,300}]])
  end

  -- If apollo running, show that
  local apollo_res = apollo()
  if apollo_res then return apollo_res end

  -- Fall back to mpd status
  -- Usually paused if you get to this point
  return conky_parse('$mpd_status')
end
