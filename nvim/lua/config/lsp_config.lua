local lspconfig = require('lspconfig')

local stuff = {

	-- Setting up LSP Config
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			if vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc') then
				return
			end
		end

		client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
			runtime = {
				version = 'LuaJIT'
			},

			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME
				}
			}
		})
	end,

	settings = {
		Lua = {
		-- 	format = {
		-- 		enable = true
		-- 	}
		}
	},
}

lspconfig.lua_ls.setup(stuff)
