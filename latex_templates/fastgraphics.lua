require "lfs"

local function basename(str)
	local name = string.gsub(str, "(.*/)(.*)", "%2")
	return name
end

local function dirname(str)
	if str:match(".-/.-") then
		local name = string.gsub(str, "(.*/)(.*)", "%1")
		return name
	else
		return ''
	end
end

--- Check if a file or directory exists in this path
function exists(file)
	local ok, err, code = os.rename(file, file)
	if not ok then
		if code == 13 then
			-- Permission denied, but it exists
			return true
		end
	end
	return ok, err
end

--- Check if a directory exists in this path
function isdir(path)
	-- "/" works on both Unix and Windows
	return exists(path.."/")
end

local function map(tbl, f)
	local t = {}
	for k,v in pairs(tbl) do
		t[k] = f(v)
	end
	return t
end

function string:split(sep)
	sep = sep or '%s+'
	local t={}
	for str in self:gmatch("([^"..sep.."]+)") do
		table.insert(t, str)
	end
	return t
end

function string:starts_with(substr)
	return self:sub(1, string.len(substr)) == substr
end


local function fastincludegraphics(draft, paths, optional, filename)
	-- print()
	-- print(draft)
	-- print(paths)
	-- print(optional)
	-- print(filename)
	paths = paths:split('}{')

	-- tex.print(string.format(
	-- 	[[\graphicspath{%s}]],
	-- 	table.concat(
	-- 		map(paths, function(path) return string.format([[{%s}]], path) end),
	-- 		''
	-- 	)
	-- ))

	function includegraphics(path)
		tex.print(string.format(
			[[\includegraphics[%s,draft=false]{%s}]],
			optional,
			path))
	end

	function process_absolute_file(filepath)
		dir = dirname(filepath)
		filename = basename(filepath)

		dir_lowres = dir.."lowres/"
		path_lowres = dir_lowres..filename

		if not isdir(dir_lowres) then
			lfs.mkdir(dir_lowres)
		end

		if not exists(path_lowres) then
			local p = assert(io.popen(string.format(
				"convert '%s' -resize 5%% '%s'",
				filepath,
				path_lowres)))
			p:read('*all')
			p:close()
		end

		includegraphics(path_lowres)
	end

	if not draft then
		return includegraphics(filename)
	end

	if filename:starts_with('/') then
		return process_absolute_file(filename)
	end

	for k, path in pairs(paths) do
		-- print(path)
		filepath = table.concat({path, filename}, '')
		-- print(filepath)

		-- if right folder
		if exists(filepath) then
			return process_absolute_file(filepath)
		end

	end
	print()
	print(string.format('Warning, could not find %s', filename))
	includegraphics(filename)
end

return fastincludegraphics
