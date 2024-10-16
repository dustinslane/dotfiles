return {
	'nvim-lualine/lualine.nvim',
	dependencies =
	{
		'nvim-tree/nvim-web-devicons',

		-- A performant lsp progress status for Neovim.
		{
			"linrongbin16/lsp-progress.nvim",
			config = true,
			-- dev = true,
			-- dir = "~/github/linrongbin16/lsp-progress.nvim",
		}

	},

	config = function(_, opts)
		require("lualine").setup(opts)

		vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
		vim.api.nvim_create_autocmd("User", {
			group = "lualine_augroup",
			pattern = "LspProgressStatusUpdated",
			callback = require("lualine").refresh,
		})
	end,
	opts = {
		spinner = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" },
		client_format = function(_, spinner, series_messages)
			if #series_messages > 0 then
				return spinner
			else
				return nil
			end
		end,
		format = function(messages)
			local active_clients = vim.lsp.get_active_clients()
			if #messages > 0 then
				return table.concat(messages, " ")
			end
			-- TODO: Display the disabled icon when...
			if #active_clients <= 0 then
				return ""
			else
				return ""
			end
		end,

		sections = {
			lualine_a = { "mode" },
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = {
				{ -- Setup lsp-progress component
					function()
						return require("lsp-progress").progress({
							format = function(messages)
								local active_clients =	vim.lsp.get_active_clients()
								if #messages > 0 then
									return table.concat(messages, " ")
								end

								local client_names = {}
								for _, client in ipairs(active_clients) do
									if client and client.name ~= "" then
										table.insert(client_names,	1,	client.name)
									end
								end
								return table.concat(client_names, "  ")
							end,
						})
					end,
				},
--				"diagnostics",
			},
			lualine_y = { "filetype", "encoding", "fileformat" },
			lualine_z = { "location" },
		},
	},
}
