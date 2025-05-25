local pcall, type, loadfile, setfenv = pcall, type, loadfile, setfenv

module "addons"

list = {}

function load_meta_info(self, path)
	local chunk = loadfile(path)
	if not chunk then
		return nil
	end
	
	setfenv(chunk, {})
	local success, data = pcall(chunk)
	if not success then
		return nil
	end
	
	if not data.id then return false end
		
	list[data.id] = data
	return data
end