os.execute('node /home/marcel/.dotfiles/conky/server.js &')

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

  -- If the server thing has anything for us, use that
  local popen = assert(io.popen('curl localhost:9615/get', 'r'))
  local current = popen:read('*all')
  popen:close()
  print(current)
  if not (current == '') then
    return current
  end

  -- Well shit
  return conky_parse('$mpd_status')
end
