require("bootstrap")

-- Load the config
local config_path = vim.fn.stdpath("config")

---Load all configs in a directory
---@param dir_name string of directory
local function load_configs_in_dir(dir_name)
	for _, file in ipairs(vim.fn.readdir(config_path .. "/lua/" .. dir_name, [[v:val =~ '\.lua$']])) do
		local filename = file:gsub("%.lua$", "")

		if filename ~= "init" then
			require(dir_name .. "." .. filename)
		end
	end
end

load_configs_in_dir("config")
load_configs_in_dir("colorschemes")
