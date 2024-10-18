require("bootstrap")

-- Load the config
local config_path = vim.fn.stdpath("config")

for _, file in ipairs(vim.fn.readdir(config_path .. "/lua/config", [[v:val =~ '\.lua$']])) do
	local filename = file:gsub("%.lua$", "")

	if filename ~= "init" then
		require("config." .. filename)
	end
end
