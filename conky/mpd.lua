local curl = require 'cURL'

function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

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
--

local lines = lines_from('/home/marcel/.dotfiles/conky/env')
local config = {}

for i, line in pairs(lines) do
  local key, val = line:match("([^=]+)=(.+)")
  config[key] = val
end

local c = curl.easy_init()
c:setopt_url(config.URL)

local spacer = '                                                                                                          '

function conky_main()
  if conky_window == nil then
    return
  end

  -- If mpd running, show that
  if conky_parse('$mpd_status') == 'Playing' then
    return conky_parse([[
${image /home/marcel/.config/mpd/cover -s 300x300 -n -f 5}
${voffset 300}$alignc${scroll 24 1 $mpd_smart}
${voffset 10}${mpd_bar 4,300}]])
  end

  local result = ''
  c:perform({writefunction = function(str) result = str end})

  if not (result == '') then

    local id = string.sub(result, 0, 11)
    result = string.sub(result, 12)

    local thumbname = '/tmp/conkythumbnails/' .. id .. '.jpg'
    if not file_exists(thumbname) then
      os.execute('mkdir -p /tmp/conkythumbnails')
      f = assert(io.open(thumbname, 'w'))
      local c = curl.easy_init()
        :setopt_url('https://i.ytimg.com/vi/' .. id .. '/maxresdefault.jpg')
        :perform({ writefunction = function(str) f:write(str) end })
      f:close()
    end

    local title = ''
    while string.len(result) > 50 do
      local i = string.find(string.sub(result, 0, 50), "[ /][^ /]*$")
      title = title .. '${alignc}' .. string.sub(result, 0, i) .. '\n'
      result = string.sub(result, i + 1)
    end
    title = title .. '${alignc}' .. result

    return conky_parse([[
${image ]] .. thumbname .. [[ -s 426x240 -n -f 5}
]] .. spacer .. [[
${voffset 220}
]] .. title)
  end

  -- Well shit
  return conky_parse('$mpd_status')
end
